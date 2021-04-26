<?php
use \Monolog\Logger;
use \Monolog\Formatter\LineFormatter;
use \Monolog\Handler\StreamHandler;

class AppLogger{

    private $log;
    private $debug;
    private $error;

    public function __construct(){
        // Common logger
        $this->log = new Logger(__DIR__);
    
        // Line formatter without empty brackets in the end
        $formatter = new LineFormatter(null, null, false, true);
    
        // Debug level handler
        $debugHandler = new StreamHandler('debug.log', Logger::DEBUG);
        $debugHandler->setFormatter($formatter);
    
        // Error level handler
        $errorHandler = new StreamHandler('error.log', Logger::ERROR);
        $errorHandler->setFormatter($formatter);
    
        // This will have both DEBUG and ERROR messages
        $this->log->pushHandler($debugHandler);
    
        // This will have only ERROR messages
        $this->log->pushHandler($errorHandler);
    }


    /**
     * Get the value of debug
     */ 
    public static function debug($msg)
    {
        $log = new AppLogger();
        return $log->log->debug($msg);
    }

    /**
     * Get the value of error
     */ 
    public static function error($msg)
    {
        $log = new AppLogger();
        return $log->log->error($msg);
    }

}

?>