<?php

namespace ConsentManager\ConsentManager\Application\Controller\Admin;

use Exception as Exception;
use OxidEsales\Eshop\Application\Controller\Admin\ShopConfiguration;
use OxidEsales\Eshop\Application\Model\Shop;
use OxidEsales\Eshop\Core\Registry;

/**
 * Class MainController
 *
 * @package ConsentManager\ConsentManager\Application\Controller\Admin
 */
class MainController extends ShopConfiguration
{
    const CURRENT_TEMPLATE = '@cmconsentmanager/admin/cmconsentmanager_main';

    /**
     * Executes parent method parent::render() and returns name of template
     *
     * @return string
     */
    public function render(): string
    {
        parent::render();

        $this->addTplParam('subjlang', $this->_iEditLang);

        $oShop = oxNew( Shop::class);
        $oShop->loadInLang($this->_iEditLang, $this->_aViewData['edit']->getId());
        $this->addTplParam('edit', $oShop);

        return static::CURRENT_TEMPLATE;
    }

    /**
     * Saves changed consentmanager parameters.
     */
    public function save()
    {
        $oShop = oxNew( Shop::class);
        $aRequestData = Registry::getRequest()->getRequestEscapedParameter('editval');

        if (empty($aRequestData['oxshops__cmconsentmanagerpid'])
            || !is_numeric($aRequestData['oxshops__cmconsentmanagerpid'])
            || $aRequestData['oxshops__cmconsentmanagerpid'] <= 0
        ) {
            Registry::getUtilsView()->addErrorToDisplay(
                'EXCEPTION_CMCONSENTMANAGER_INVALID_CMPID'
            );
            return;
        }

        try {
            if ( $oShop->loadInLang( $this->_iEditLang, $this->getEditObjectId() ) ) {
                $oShop->setLanguage( 0 );
                $oShop->assign( $aRequestData );
                $oShop->setLanguage( $this->_iEditLang );
                $oShop->save();
            }
        } catch ( Exception $e ) {
            Registry::getUtilsView()->addErrorToDisplay($e);
        }
    }
}
