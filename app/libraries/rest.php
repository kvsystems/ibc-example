<?php

class Rest  {

  const HTTP_OK = 200;
  const HTTP_CREATED = 201;
  const HTTP_ACCEPTED = 202;
  const HTTP_NON_AUTHORITATIVE_INFORMATION = 203;
  const HTTP_NO_CONTENT = 204;
  const HTTP_RESET_CONTENT = 205;
  const HTTP_PARTIAL_CONTENT = 206;
  const HTTP_MULTI_STATUS = 207;
  const HTTP_ALREADY_REPORTED = 208;
  const HTTP_IM_USED = 226;
  const HTTP_MULTIPLE_CHOICES = 300;
  const HTTP_MOVED_PERMANENTLY = 301;
  const HTTP_FOUND = 302;
  const HTTP_SEE_OTHER = 303;
  const HTTP_NOT_MODIFIED = 304;
  const HTTP_USE_PROXY = 305;
  const HTTP_RESERVED = 306;
  const HTTP_TEMPORARY_REDIRECT = 307;
  const HTTP_PERMANENTLY_REDIRECT = 308;
  const HTTP_BAD_REQUEST = 400;
  const HTTP_UNAUTHORIZED = 401;
  const HTTP_PAYMENT_REQUIRED = 402;
  const HTTP_FORBIDDEN = 403;
  const HTTP_NOT_FOUND = 404;
  const HTTP_METHOD_NOT_ALLOWED = 405;
  const HTTP_NOT_ACCEPTABLE = 406;
  const HTTP_PROXY_AUTHENTICATION_REQUIRED = 407;
  const HTTP_REQUEST_TIMEOUT = 408;
  const HTTP_CONFLICT = 409;
  const HTTP_GONE = 410;
  const HTTP_LENGTH_REQUIRED = 411;
  const HTTP_PRECONDITION_FAILED = 412;
  const HTTP_REQUEST_ENTITY_TOO_LARGE = 413;
  const HTTP_REQUEST_URI_TOO_LONG = 414;
  const HTTP_UNSUPPORTED_MEDIA_TYPE = 415;
  const HTTP_REQUESTED_RANGE_NOT_SATISFIABLE = 416;
  const HTTP_EXPECTATION_FAILED = 417;
  const HTTP_I_AM_A_TEAPOT = 418;
  const HTTP_UNPROCESSABLE_ENTITY = 422;
  const HTTP_LOCKED = 423;
  const HTTP_FAILED_DEPENDENCY = 424;
  const HTTP_RESERVED_FOR_WEBDAV_ADVANCED_COLLECTIONS_EXPIRED_PROPOSAL = 425;
  const HTTP_UPGRADE_REQUIRED = 426;
  const HTTP_PRECONDITION_REQUIRED = 428;
  const HTTP_TOO_MANY_REQUESTS = 429;        
  const HTTP_REQUEST_HEADER_FIELDS_TOO_LARGE = 431;
  const HTTP_INTERNAL_SERVER_ERROR = 500;
  const HTTP_NOT_IMPLEMENTED = 501;
  const HTTP_BAD_GATEWAY = 502;
  const HTTP_SERVICE_UNAVAILABLE = 503;
  const HTTP_GATEWAY_TIMEOUT = 504;
  const HTTP_VERSION_NOT_SUPPORTED = 505;
  const HTTP_VARIANT_ALSO_NEGOTIATES_EXPERIMENTAL = 506;
  const HTTP_INSUFFICIENT_STORAGE = 507;
  const HTTP_LOOP_DETECTED = 508;
  const HTTP_NOT_EXTENDED = 510;
  const HTTP_NETWORK_AUTHENTICATION_REQUIRED = 511;

  private $_codes = [
      'HTTP_OK'                   => self::HTTP_OK ,
      'HTTP_CREATED'              => self::HTTP_CREATED,
      'HTTP_ACCEPTED'             => self::HTTP_ACCEPTED,
      'HTTP_NO_CONTENT'           => self::HTTP_NO_CONTENT,
      'HTTP_NOT_MODIFIED'         => self::HTTP_NOT_MODIFIED ,
      'HTTP_BAD_REQUEST'          => self::HTTP_BAD_REQUEST,
      'HTTP_UNAUTHORIZED'         => self::HTTP_UNAUTHORIZED,
      'HTTP_FORBIDDEN'            => self::HTTP_FORBIDDEN ,
      'HTTP_NOT_FOUND'            => self::HTTP_NOT_FOUND,
      'HTTP_METHOD_NOT_ALLOWED'   => self::HTTP_METHOD_NOT_ALLOWED,
      'HTTP_NOT_ACCEPTABLE'       => self::HTTP_NOT_ACCEPTABLE,
      'HTTP_CONFLICT'             => self::HTTP_CONFLICT,
      'HTTP_INTERNAL_SERVER_ERROR'=> self::HTTP_INTERNAL_SERVER_ERROR,
      'HTTP_NOT_IMPLEMENTED'      => self::HTTP_NOT_IMPLEMENTED
  ];

  public function Response( $data, $code = self::HTTP_OK )  {
      http_response_code( $code );
      header('Content-Type: application/json');
      echo json_encode( $data ) . PHP_EOL;
  }
  
  public function GetStatus( $status )  {

    return $this->_codes[$status]
      ? $this->_codes[$status]
      : $this->_codes['HTTP_CONFLICT'];

  }
    
}