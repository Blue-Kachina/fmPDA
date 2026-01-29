<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\LevelSetList;
use Rector\Set\ValueObject\SetList;

return static function (RectorConfig $rectorConfig): void {
    // Scope Rector to the library code first; examples/demos are excluded for safety
    $rectorConfig->paths([
        __DIR__ . '/fmPDA',
    ]);

    // Exclude non-source folders and generated/vendor content
    $rectorConfig->skip([
        __DIR__ . '/vendor',
        __DIR__ . '/docs_and_examples',
        __DIR__ . '/FM Demo Database',
        __DIR__ . '/fmPDA_ModularFileMakerVersion',
    ]);

    // Import fully-qualified names and shorten where safe
    $rectorConfig->importNames();

    $rectorConfig->sets([
//        LevelSetList::UP_TO_PHP_56,
        LevelSetList::UP_TO_PHP_70,
//        LevelSetList::UP_TO_PHP_71,
//        LevelSetList::UP_TO_PHP_72,
//        LevelSetList::UP_TO_PHP_73,
//        LevelSetList::UP_TO_PHP_74,
//        LevelSetList::UP_TO_PHP_80,
//        LevelSetList::UP_TO_PHP_81,
//        LevelSetList::UP_TO_PHP_82,
        SetList::CODE_QUALITY,
        SetList::TYPE_DECLARATION,
    ]);
};
