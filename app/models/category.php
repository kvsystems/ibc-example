<?

namespace Evie\App\Models;

use Evie\System\Kernel\Model;

class Category extends Model  {

    public function __construct() {

        parent::__construct();

    }

    public function getCategories( $filter = [] ) {

        $sql = 'SELECT * FROM eve_category c 
          LEFT JOIN eve_category_description cd
            ON c.category_id = cd.category_id';

        $parent = isset( $filter['parent'] ) ? (int) $filter['parent'] : 0;

        $sql .= ' WHERE c.status = {?} AND cd.language_id = {?} AND c.parent = {?}';
        $values = [ 1, 1, $parent ];

        $orderData = [
            'c.category_id'
        ];

        $sql .= isset( $filter['order'] ) && in_array( $filter['order'], $orderData )
            ? ' ORDER BY ' . $filter['order']
            : ' ORDER BY c.category_id';

        $sql .= isset( $filter['sort'] ) && $filter['sort'] == 'DESC'
            ? ' DESC' : ' ASC';

        $sql .= isset( $filter['limit'] )
            ? ' LIMIT ' . (int) $filter['limit']
            : ' LIMIT 10';

        return $this->db['exchange']->SelectTable( $sql, $values );

    }

    public function getCategoryIdByAlias( $alias )    {

        $sql = "SELECT c.category_id FROM eve_category c 
          WHERE c.status = {?} AND c.alias = {?} LIMIT 1";

        return $this->db['exchange']->SelectCell( $sql, [ 1, $alias ] );

    }

}