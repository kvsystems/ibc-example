<?

namespace Evie\App\Models;

use Evie\System\Kernel\Model;

class Customer extends Model  {

    const PRIORITY_GROUP_CODE = 2;

    public function __construct() {

        parent::__construct();

    }

    public function getCustomers()  {

        $sql = 'SELECT DISTINCT * FROM eve_customer c 
          LEFT JOIN eve_customer_group cg 
            ON ( c.group_id = cg.group_id ) 
          LEFT JOIN eve_customer_group_description cgd ON ( cg.group_id = cgd.group_id ) 
          WHERE c.status = {?}';

        return $this->db['exchange']->SelectTable( $sql, [1] );

    }

    public function priorityCustomer( $id ) {

        $sql = "SELECT customer_id FROM eve_customer 
          WHERE customer_id = {?} AND group_id = {?} LIMIT 1";

        return $this->db['exchange']->SelectCell( $sql, [ (int) $id, self::PRIORITY_GROUP_CODE ] );

    }

    public function getCustomerById( $id )   {

        $sql = "SELECT customer_id FROM eve_customer 
          WHERE customer_id = {?} LIMIT 1";

        return $this->db['exchange']->SelectCell( $sql, [ (int) $id ] );

    }

}