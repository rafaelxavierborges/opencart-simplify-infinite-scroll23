<?php

class ControllerExtensionModuleIscroller extends Controller {

    public function index() {
        $settings = $this->config->get('iscroller_module');

        $isMijoShop = class_exists('MijoShop') && defined('JPATH_MIJOSHOP_OC');

        $jsPath = 'catalog/view/javascript/';

        if ($isMijoShop) {
            $jsPath = JPATH_MIJOSHOP_OC . '/' . $jsPath;
            MijoShop::get('base')->addHeader($jsPath . "jquery.isotope.js", false);
        } else {
            $this->document->addScript($jsPath . 'jquery.isotope.js');
        }
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/stylesheet/brainyfilter.css')) {
            $theme = $this->config->get('config_template');
        } else {
            $theme = 'default';
        }
        $this->document->addStyle("catalog/view/theme/$theme/stylesheet/isotope.css");

        $lang = $this->session->data['language'];

        $settings['infScroll']['loadingMsg'] = '';
        $settings['infScroll']['finishMsg'] = '';

        return "<script type='text/javascript'>"
                . "jQuery(document).on('ready', function(){"
                . " try { "
                . "IScroller.init(" . json_encode($settings) . ");"
                . " } catch(e) { if (e.stack) console.error(e.stack); else console.error(e); }"
                . "});"
                . "</script>";
    }

}
