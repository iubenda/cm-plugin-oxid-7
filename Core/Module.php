<?php

namespace ConsentManager\ConsentManager\Core;

use Doctrine\DBAL\Exception as DoctrineException;
use Doctrine\DBAL\Query\QueryBuilder;
use Doctrine\DBAL\Schema\Column;
use OxidEsales\Eshop\Application\Model\Shop;
use OxidEsales\Eshop\Core\DbMetaDataHandler;
use OxidEsales\EshopCommunity\Internal\Container\ContainerFactory;
use OxidEsales\EshopCommunity\Internal\Framework\Database\QueryBuilderFactoryInterface;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;

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
     * @throws ContainerExceptionInterface
     * @throws DoctrineException
     * @throws NotFoundExceptionInterface
     */
    public static function onActivate(): void
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
     * @throws ContainerExceptionInterface
     * @throws DoctrineException
     * @throws NotFoundExceptionInterface
     */
    public static function addDatabaseStructure(): void
    {
        $shop = oxNew(Shop::class);

        // '1.0.0' changes
        self::addColumnIfNotExists($shop->getCoreTableName(), 'CMCONSENTMANAGERPID', "ALTER TABLE {$shop->getCoreTableName()} ADD COLUMN CMCONSENTMANAGERPID varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;");
        self::addColumnIfNotExists($shop->getCoreTableName(), 'CMCONSENTMANAGERBLOCKINGMODE', "ALTER TABLE {$shop->getCoreTableName()} ADD COLUMN CMCONSENTMANAGERBLOCKINGMODE int(8) DEFAULT 0 NOT NULL;");
        self::addColumnIfNotExists($shop->getCoreTableName(), 'CMCONSENTMANAGERCUSTOMHTML', "ALTER TABLE {$shop->getCoreTableName()} ADD COLUMN CMCONSENTMANAGERCUSTOMHTML text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;");

    }

    /**
     * Add a column to a database table.
     *
     * @param string $sTableName    table name
     * @param string $sColumnName   column name
     * @param string $sQuery        sql-query to add column to table
     *
     * @return void
     * @throws DoctrineException
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    public static function addColumnIfNotExists(string $sTableName, string $sColumnName, string $sQuery)
    {
        /** @var QueryBuilder $queryBuilder */
        $queryBuilder = ContainerFactory::getInstance()
            ->getContainer()
            ->get(QueryBuilderFactoryInterface::class)
            ->create();

        if (!in_array(
            true,
            array_map(
                function (Column $column) use ($sColumnName) {
                    return $column->getName() == $sColumnName;
                },
                $queryBuilder->getConnection()->getSchemaManager()->listTableColumns($sTableName)
            )
        )) {
            $queryBuilder->getConnection()->executeQuery($sQuery);
        }
    }
}
