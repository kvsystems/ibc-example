<?php

namespace Evie\App\Modules\Actions\Controllers;

use Evie\System\Kernel\Controller;
use Evie\System\Kernel\Loader;

class Actions extends Controller  {

  protected $rent = null;
  protected $rest = null;
  protected $units = null;
  protected $customer = null;
  protected $shedule = null;

  const MIN_RENT_TIME = 3600;

  public function __construct() {
      
    parent::__construct();
    $this->rest  = Loader::Library( 'rest' );

    Loader::Helper( 'date' );
    $this->rent  = Loader::Model('rent');
    $this->units  = Loader::Model('slave');
    $this->customer  = Loader::Model('customer');
    $this->shedule = Loader::Model('shedule');

  }

  public function Check()   {
      $this->_process();
  }

  private function _process() {

      $startRent = $this->Post('start_rent') ? roundToHour(strtotime($this->Post('start_rent'))) : 0;
      $expireRent = $this->Post('expire_rent') ? roundToHour(strtotime($this->Post('expire_rent')), true) : 0;
      $nowRent = roundToHour(strtotime('now'));
      $slaveId = $this->Post('slave_id') ? (int)$this->Post('slave_id') : 0;
      $customerId = $this->Post('customer_id') ? (int)$this->Post('customer_id') : 0;
      $slave = $this->units->getSlaveById($slaveId);
      $customer = $this->customer->getCustomerById($customerId);

      if( $startRent - $nowRent < 0 || $expireRent - $nowRent <= 0 )    {
          return $this->rest->Response(
              ['status' => 'error', 'message' => 'The application can not be created in the past'],
              $this->rest->GetStatus('HTTP_METHOD_NOT_ALLOWED')
          );
      }

      if ($startRent == 0) {
          return $this->rest->Response(
              ['status' => 'error', 'message' => 'The rental start date can not be zero'],
              $this->rest->GetStatus('HTTP_METHOD_NOT_ALLOWED')
          );
      }

      if ($expireRent == 0) {
          return $this->rest->Response(
              ['status' => 'error', 'message' => 'The end date of the lease can not be zero'],
              $this->rest->GetStatus('HTTP_METHOD_NOT_ALLOWED')
          );
      }

      if (!$slave) {
          return $this->rest->Response(
              ['status' => 'error', 'message' => 'This slave does not exist'],
              $this->rest->GetStatus('HTTP_NOT_FOUND')
          );
      }

      if (!$customer) {
          return $this->rest->Response(
              ['status' => 'error', 'message' => 'This customer was not found in the system'],
              $this->rest->GetStatus('HTTP_NOT_FOUND')
          );
      }

      $startHours = secondsToHours(roundToEndOfDay($startRent) - $startRent);
      $expireHours = secondsToHours($expireRent - roundToStartOfDay($expireRent));

      $rentalPeriod = $expireRent - $startRent;
      $schedule = $this->shedule->getSlaveShedule($slave['schedule_id']);

      if( $startHours > $schedule['hours'] || $expireHours > $schedule['hours'] ) {
          return $this->rest->Response(
              ['status' => 'error', 'message' => 'A slave can not work ' . $schedule['hours'] . ' hours a day'],
              $this->rest->GetStatus( 'HTTP_METHOD_NOT_ALLOWED' )
          );
      }

      if( $rentalPeriod <= 0 )  {
          return $this->rest->Response(
              ['status' => 'error', 'message' => 'The rental period must be greater than zero'],
              $this->rest->GetStatus( 'HTTP_METHOD_NOT_ALLOWED' )
          );
      }

      if( $rentalPeriod < self::MIN_RENT_TIME ) $rentalPeriod = self::MIN_RENT_TIME;


      $rentCost = $this->rent->calculateRentCost([
          'start'    => $startHours,
          'expire'   => $expireHours,
          'limit'    => $schedule['hours'],
          'period'   => secondsToHours( $rentalPeriod ),
          'cost'     => $slave['cost']
      ]);

      if( $this->customer->priorityCustomer( $customerId ) ) {

          return $this->rest->Response(
              ['status' => 'success', 'message' => 'The slave is available for vip client', 'cost' => $rentCost, 'priority' => 'vip'],
              $this->rest->GetStatus( 'HTTP_OK' )
          );

      } else {

          if( !$this->rent->rentPossibility( $slaveId ) )  {
              return $this->rest->Response(
                  ['success' => 'success', 'message' => 'The slave is available for rent', 'cost' => $rentCost, 'priority' => 'local'],
                  $this->rest->GetStatus( 'HTTP_OK' )
              );
          } else {
              return $this->rest->Response(
                  ['status' => 'error', 'message' => 'This slave is busy and can not be rented'],
                  $this->rest->GetStatus( 'HTTP_METHOD_NOT_ALLOWED' )
              );
          }

      }
  }

  
}