<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static OptionOne()
 * @method static static OptionTwo()
 * @method static static OptionThree()
 */
final class DomainRecordTypeEnums extends Enum
{
    const A =   'A';
    const TXT =  'TXT';
    const CNAME =  'CNAME';
    const MX =  'MX';
}
