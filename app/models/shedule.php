<?

namespace Evie\App\Models;

use Evie\System\Kernel\Model;

class Shedule extends Model  {

    public function __construct() {

        parent::__construct();

    }

    public function getSlaveShedule( $shedule_id )   {

        return $this->db['exchange']->SelectString(
            "SELECT * FROM eve_schedule WHERE schedule_id = {?} LIMIT 1",[$shedule_id]
        );

    }

}