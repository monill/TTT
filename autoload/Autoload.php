<?php

use App\Controllers\Index;
use App\Libs\Session;
use App\Libs\AntiDDos;

class Autoload {

    /** @var null The controller */
    private $controller = null;

    /** @var null The method (of the above controller), often also named "action" */
    private $action = null;

    /** @var array URL parameters */
    private $params = array();

    /**
     * "Start" the application:
     * Analyze the URL elements and calls the according controller/method or the fallback
     */
    public function __construct() {
        ##start session
        Session::startSession();
        ##create array with URL parts in $url
        $this->splitUrl();
        ##start AntiDDos
        //AntiDDos::start();
        // check for controller: no controller given ? then load start-page
        if (!$this->controller) {
            $page = new Index();
            $page->index();
        } elseif (file_exists(CTRL . ucfirst($this->controller) . ".php")) {
            // here we did check for controller: does such a controller exist ?
            // if so, then load this file and create this controller like \App\Controllers\Index
            $controller = "\\App\\Controllers\\" . ucfirst($this->controller);
            $this->controller = new $controller();
            // check for method: does such a method exist in the controller ?
            if (method_exists($this->controller, $this->action) &&
                    is_callable(array($this->controller, $this->action))) {
                if (!empty($this->params)) {
                    // Call the method and pass arguments to it
                    call_user_func_array(array($this->controller, $this->action), $this->params);
                } else {
                    // If no parameters are given, just call the method without parameters, like $this->home->method();
                    $this->controller->{$this->action}();
                }
            } else {
                if (strlen($this->action) == 0) {
                    // no action defined: call the default index() method of a selected controller
                    $this->controller->index();
                } else {
                    header("location: " . URL . "/error");
                }
            }
        } else {
            header("location: " . URL . "/error");
        }
    }

    /**
     * Get and split the URL
     */
    private function splitUrl() {
        if (isset($_GET['url'])) {
            // split URL
            $url = trim(rtrim(isset($_GET['url']) ? $_GET['url'] : '', '/'));
            $url = filter_var($url, FILTER_SANITIZE_URL);
            $url = explode('/', $url);

            // Put URL parts into according properties
            // By the way, the syntax here is just a short form of if/else, called "Ternary Operators"
            // @see http://davidwalsh.name/php-shorthand-if-else-ternary-operators
            $this->controller = isset($url[0]) ? $url[0] : null;
            $this->action = isset($url[1]) ? $url[1] : null;

            // Remove controller and action from the split URL
            unset($url[0], $url[1]);

            // Rebase array keys and store the URL params
            $this->params = array_values($url);

            ##For debugging
            //echo count($url). "<br />";
            ##For debugging. uncomment this if you have problems with the URL
            //echo "Controller: " . $this->controller . "<br />";
            //echo "Action: " . $this->action . "<br />";
            //echo "Parameters: " . print_r($this->params, true) . "<br />";
        }
    }

}
