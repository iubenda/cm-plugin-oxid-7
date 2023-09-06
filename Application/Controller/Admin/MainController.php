<?php

namespace ConsentManager\ConsentManager\Application\Controller\Admin;

/**
 * Class MainController
 * @package ConsentManager\ConsentManager\Application\Controller\Admin
 */
class MainController extends \OxidEsales\Eshop\Application\Controller\Admin\ShopConfiguration
{
    const CURRENT_TEMPLATE = '@cmconsentmanager/admin/cmconsentmanager_main';

    /**
     * Executes parent method parent::render() and returns name of template
     *
     * @return string
     */
    public function render()
    {
        parent::render();

        $this->_aViewData['subjlang'] = $this->_iEditLang;

        $oShop = oxNew(\OxidEsales\Eshop\Application\Model\Shop::class);
        $oShop->loadInLang($this->_iEditLang, $this->_aViewData['edit']->getId());
        $this->_aViewData['edit'] = $oShop;

        return static::CURRENT_TEMPLATE;
    }

    /**
     * Saves changed consentmanager parameters.
     */
    public function save()
    {
        $oShop = oxNew(\OxidEsales\Eshop\Application\Model\Shop::class);
        $aRequestData = \OxidEsales\Eshop\Core\Registry::getConfig()->getRequestParameter('editval');

        if (empty($aRequestData['oxshops__cmconsentmanagerpid'])
            || !is_numeric($aRequestData['oxshops__cmconsentmanagerpid'])
            || $aRequestData['oxshops__cmconsentmanagerpid'] <= 0
        ) {
            return \OxidEsales\Eshop\Core\Registry::getUtilsView()->addErrorToDisplay(
                'EXCEPTION_CMCONSENTMANAGER_INVALID_CMPID'
            );
        }

        if ($oShop->loadInLang($this->_iEditLang, $this->getEditObjectId())) {
            $oShop->setLanguage(0);
            $oShop->assign($aRequestData);
            $oShop->setLanguage($this->_iEditLang);
            $oShop->save();
        }
    }
}
