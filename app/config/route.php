<?php

$config['route']['get'] = [
  '/style/(:any)/'   => 'document@document@style',
  '/script/(:any)/'  => 'document@document@script',
  '/library/(:any)/' => 'document@document@library',
  '/fonts/(:any)/'   => 'document@document@font',
  '/image/(:any)/'   => 'document@document@image',
  '/channel/(:any)/' => 'document@explorer@index'
];

$config['route']['post'] = [
  '/api/rent/check' =>  'actions@actions@check',
  '/api/rent/confirm'   =>  'actions@actions@confirm'
];