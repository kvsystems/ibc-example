<?

namespace Evie\App\Models;

use Evie\System\Kernel\Model;

class Slave extends Model  {

    public function __construct() {

        parent::__construct();

    }

    public function getSlaves( $filter = [] )    {

        $sql = 'SELECT DISTINCT * FROM eve_slave s 
            RIGHT JOIN eve_slave_description sd 
              ON ( s.slave_id = sd.slave_id ) 
            RIGHT JOIN eve_slave_to_currency sc 
              ON ( s.slave_id = sc.slave_id )';

        if( isset( $filter['category'] ) && (int) $filter['category']  > 0 )  {
            $sql .= ' RIGHT JOIN eve_slave_to_category stc
                ON s.slave_id = stc.slave_id';
        }

        $sql .= ' WHERE s.status = {?} AND sd.language_id = {?}';
        $values = [ 1, 1 ];

        if( isset( $filter['category'] ) && (int) $filter['category']  > 0 )  {

            $category = isset( $filter['category'] )
                ? (int) $filter['category'] : 0;

            $sql .= ' AND stc.category_id = {?}';

            array_push( $values, $category );

        }

        $orderData = [
            's.slave_id',
            'sc.cost'
        ];

        $sql .= isset( $filter['order'] ) && in_array( $filter['order'], $orderData )
            ? ' ORDER BY ' . $filter['order']
            : ' ORDER BY s.slave_id';

        $sql .= isset( $filter['sort'] ) && $filter['sort'] == 'DESC'
            ? ' DESC' : ' ASC';

        $sql .= isset( $filter['limit'] )
            ? ' LIMIT ' . (int) $filter['limit']
            : ' LIMIT 10';

        return $this->db['exchange']->SelectTable( $sql, $values );
    }

    public function getSlaveById( $id )  {

        $sql = 'SELECT DISTINCT * FROM eve_slave s 
            RIGHT JOIN eve_slave_description sd 
              ON ( s.slave_id = sd.slave_id ) 
            RIGHT JOIN eve_slave_to_currency sc 
              ON ( s.slave_id = sc.slave_id ) 
            WHERE s.status = {?} AND sd.language_id = {?} 
              AND s.slave_id = {?} LIMIT 1';

        $values = [ 1, 1, $id ];

        return $this->db['exchange']->SelectString( $sql, $values );

    }

}