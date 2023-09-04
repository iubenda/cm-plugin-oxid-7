<?php

namespace ConsentManager\ConsentManager\Core;

use OxidEsales\Eshop\Core\DatabaseProvider;
use OxidEsales\Eshop\Core\DbMetaDataHandler;

/**
 * Class Module
 * @package ConsentManager\ConsentManager\Core
 */
class Module
{
    /**
     * Execute action on activate event.
     *
     * @return void
     */
    public static function onActivate()
    {
        self::addDatabaseStructure();
        self::updateViews();
        self::clearTmp();
    }

    /**
     * Execute action on deactivate event.
     *
     * @return void
     */
    public static function onDeactivate()
    {
        self::clearTmp();
    }

    /**
     * Regenerates database view-tables.
     *
     * @return void
     */
    public static function updateViews()
    {
        $oDbHandler = oxNew(DbMetaDataHandler::class);
        $oDbHandler->updateViews();
    }

    /**
     * Clear tmp dir and smarty cache.
     *
     * @return void
     */
    public static function clearTmp()
    {
        $sTmpDir = getShopBasePath() . "/tmp/";
        $sSmartyDir = $sTmpDir . "smarty/";

        foreach (glob($sTmpDir . "*.txt") as $sFileName) {
            unlink($sFileName);
        }
        foreach (glob($sSmartyDir . "*.php") as $sFileName) {
            unlink($sFileName);
        }
    }

    /**
     * Creating database structure changes.
     *
     * @return void
     */
    public static function addDatabaseStructure()
    {
        // '1.0.0' changes
        self::addColumnIfNotExists("oxshops", 'CMCONSENTMANAGERPID', "ALTER TABLE oxshops ADD COLUMN CMCONSENTMANAGERPID varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;");
        self::addColumnIfNotExists("oxshops", 'CMCONSENTMANAGERPID_1', "ALTER TABLE oxshops ADD COLUMN CMCONSENTMANAGERPID_1 varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;");
        self::addColumnIfNotExists("oxshops", 'CMCONSENTMANAGERBLOCKINGMODE', "ALTER TABLE oxshops ADD COLUMN CMCONSENTMANAGERBLOCKINGMODE int(8) DEFAULT 0 NOT NULL;");
        self::addColumnIfNotExists("oxshops", 'CMCONSENTMANAGERBLOCKINGMODE_1', "ALTER TABLE oxshops ADD COLUMN CMCONSENTMANAGERBLOCKINGMODE_1 int(8) DEFAULT 0 NOT NULL;");
        self::addColumnIfNotExists("oxshops", 'CMCONSENTMANAGERCUSTOMHTML', "ALTER TABLE oxshops ADD COLUMN CMCONSENTMANAGERCUSTOMHTML text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;");
        self::addColumnIfNotExists("oxshops", 'CMCONSENTMANAGERCUSTOMHTML_1', "ALTER TABLE oxshops ADD COLUMN CMCONSENTMANAGERCUSTOMHTML_1 text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;");

    }

    /**
     * Add a database table.
     *
     * @param string $sTableName table to add
     * @param string $sQuery     sql-query to add table
     *
     * @return boolean true or false
     */
    public static function addTableIfNotExists($sTableName, $sQuery)
    {
        if (!DatabaseProvider::getDb()->select("SHOW TABLES LIKE '{$sTableName}'")->count()) {
            DatabaseProvider::getDb()->execute($sQuery);
            return true;
        }
        return false;
    }

    /**
     * Add a column to a database table.
     *
     * @param string $sTableName  table name
     * @param string $sColumnName column name
     * @param string $sQuery      sql-query to add column to table
     *
     * @return boolean true or false
     */
    public static function addColumnIfNotExists($sTableName, $sColumnName, $sQuery)
    {
        if (!DatabaseProvider::getDb()->select("SHOW COLUMNS FROM {$sTableName} LIKE '{$sColumnName}'")->count()) {
            DatabaseProvider::getDb()->execute($sQuery);
            return true;
        }
        return false;
    }

    /**
     * Insert a database row to an existing table.
     *
     * @param string $sTableName database table name
     * @param array  $aKeyValue  keys of rows to add for existance check
     * @param string $sQuery     sql-query to insert data
     *
     * @return boolean true or false
     */
    public static function insertRowIfNotExists($sTableName, $aKeyValue, $sQuery)
    {
        $sWhere = '';
        foreach ($aKeyValue as $key => $value) {
            $sWhere .= " AND $key = '$value'";
        }

        if (!DatabaseProvider::getDb()->select("SELECT * FROM {$sTableName} WHERE 1" . $sWhere)->count()) {
            DatabaseProvider::getDb()->execute($sQuery);
            return true;
        }
        return false;
    }
}
