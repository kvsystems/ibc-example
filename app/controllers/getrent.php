<?php

namespace Evie\App\Controllers;

use Evie\System\Kernel\Loader;
use Evie\System\Template\Template;
use Evie\App\Core\AppController;

class Getrent extends AppController  {

    protected $units     = null;
    protected $customers = null;
    protected $catch     = null;

    public function __construct() {

        Loader::Language('rent');
        parent::__construct();

        $this->catch = Loader::Helper( 'trycatch' );
        $this->units = Loader::Model('slave');
        $this->customers = Loader::Model('customer');

    }

    public function Index()  {

        $slave = $this->Get( 'slave' ) ? (int) $this->Get( 'slave' ): 0;
        $this->data['customers'] = $this->customers->getCustomers();

        if( $slave > 0 && $this->data['customers'] ) {

            $this->data['slave'] = $this->units->GetSlaveById( $slave );
            $this->data['slave']['rent_start']  = date("Y-m-d H:i");
            $this->data['slave']['rent_expire'] = date("Y-m-d H:i", time() + 60*60);
            Template::View("getrent", $this->data );

        } else redirect();

    }


}