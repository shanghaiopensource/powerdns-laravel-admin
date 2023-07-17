<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static OptionOne()
 * @method static static OptionTwo()
 * @method static static OptionThree()
 */
final class OrderStatusEnums extends Enum
{
    const Option_0 =    0; // create
    const Option_1 =    1; // payed
    const Option_2 =    2; // payment failure
}
