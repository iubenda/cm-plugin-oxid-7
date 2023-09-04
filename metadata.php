<?php
/**
 * Metadata file for module
 *
 * @file          metadata.php
 * @link          https://www.consentmanager.net
 * @copyright (C) ConsentManager
 * @package       modules
 * @addtogroup    modules
 */

/**
 * Metadata version
 */
$sMetadataVersion = '2.0';

/**
 * Module information
 */
$aModule = [
    'id' => 'cmconsentmanager',
    'title' => 'consentmanager integration for OXID',
    'description' => [
        'de' => '<b>Achtung:</b> Um dieses Modul nutzen zu können, müssen Sie sich kostenlos unter www.consentmanager.net registrieren.
                 Melden Sie sich nach der Registrierung bei Ihrem Konto an, richten Sie Ihre Website(s) ein und klicken Sie auf 
                 Menü> Codes abrufen in um die CMP-ID Ihrer Website zu sehen. Gehen Sie dann 
                 zu OXID Master Settings > Core Settings > consentmanager und konfigurieren Sie das Modul.',
        'en' => '<b>Attention:</b> In order to use this module, you have to register for free at www.consentmanager.net. 
                 Once registered, please login to your account, setup your website(s) and click on Menu > Get Codes in 
                 order to see the CMP-ID of your website. Then go to OXID Master Settings > Core Settings > consentmanager
                 and configure the module.',
    ],
    'thumbnail' => 'logo.png',
    'version' => '1.0.0',
    'author' => 'ConsentManager',
    'email' => 'info@consentmanager.net',
    'url' => 'https://www.consentmanager.net',
    'blocks' => [
        [
            'template' => 'layout/base.tpl',
            'block' => 'head_meta_robots',
            'file' => '/Application/views/blocks/head_meta_robots.tpl',
        ],
    ],
    'templates'   => [
        'cmconsentmanager_main.tpl' => 'consentmanager/consentmanager/Application/views/admin/tpl/consentmanager_main.tpl',
    ],
    'controllers' => [
        'cmconsentmanager_main' => \ConsentManager\ConsentManager\Application\Controller\Admin\MainController::class,
    ],
    'events'      => [
        'onActivate'   => '\ConsentManager\ConsentManager\Core\Module::onActivate',
        'onDeactivate' => '\ConsentManager\ConsentManager\Core\Module::onDeactivate',
    ]
];
