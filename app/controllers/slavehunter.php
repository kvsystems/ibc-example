<?php

namespace Evie\App\Controllers;

use Evie\System\Kernel\Loader;
use Evie\System\Template\Template;
use Evie\App\Core\AppController;

class Slavehunter extends AppController  {

    protected $catalog = null;
    protected $units = null;

    public function __construct() {

        Loader::Language('slavehunter');
        parent::__construct();

        $this->catalog = Loader::Model('category');
        $this->units = Loader::Model('slave');

    }

    public function Index()  {

        $id = $this->Get( 'alias' )
            ? $this->catalog->getCategoryIdByAlias( $this->Get( 'alias' ) ) : 0;

        $filter = empty( $id )
            ? [] : [ 'parent' => $id ];

        $this->data['catalog'] = $this->catalog->getCategories( $filter );
        $this->data['slaves']  = $this->units->getSlaves( [ 'category' => $id ] );
        $this->data['slave_rent_uri'] = '/getrent/?slave=';

        Template::View( "slavehunter", $this->data );

    }


}