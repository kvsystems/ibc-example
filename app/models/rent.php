<?

namespace Evie\App\Models;

use Evie\System\Kernel\Model;

class Rent extends Model  {

    const DAY_HOURS = 24;

    public function __construct() {

        parent::__construct();

    }

    public function rentPossibility( $slave_id )   {

        $sql = "SELECT rent_id FROM eve_rent WHERE slave_id = {?} AND status = {?} LIMIT 1";

        return $this->db['exchange']->SelectCell( $sql, [ (int) $slave_id, 1 ] );
    }

    public function calculateRentCost( $params = [] ) {

        $response = 0.00;

        if( isset( $params['start'] ) && isset( $params['expire'] ) && isset( $params['cost'] ) && isset( $params['period'] ) && isset( $params['limit'] ) )    {

            $halfShift = $params['start'] + $params['expire'];
            $fullShift = $params['period'] - $halfShift;

            $response = (double)((( $fullShift/self::DAY_HOURS ) * $params['limit'] ) + $halfShift) * $params['cost'];
        }

        return $response;

    }

}