<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static OptionOne()
 * @method static static OptionTwo()
 * @method static static OptionThree()
 */
final class CounponsCodeStatusEnums extends Enum
{
    const Option_0 =   0; // un use
    const Option_1 =   1; // useing
    const Option_2 = 2; // 过期
    const Option_3 = 3; // 已使用
}
