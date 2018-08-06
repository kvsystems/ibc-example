<?php

namespace Evie\App\Controllers;

use Evie\System\Kernel\Loader;
use Evie\System\Template\Template;
use Evie\App\Core\AppController;

class Main extends AppController  {

    protected $units = null;

	public function __construct() {

        Loader::Language('main');
        parent::__construct();

        $this->units = Loader::Model('slave');

	}

	public function Index()  {

        $this->data['slaves'] = $this->units->getSlaves();
	    $this->data['slave_hunter_uri'] = '/slavehunter';
        $this->data['slave_rent_uri'] = '/getrent/?slave=';
		Template::View( "index", $this->data );
    
	}


}