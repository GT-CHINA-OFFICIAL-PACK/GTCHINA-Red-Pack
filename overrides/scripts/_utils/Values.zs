#priority 999999

import crafttweaker.item.IIngredient;

global GWildcard as short = 32767;

global GColors as string[] = ["white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"];
global GColorsAlt as string[] = ["white", "orange", "magenta", "light_blue", "yellow", "lime", "pink", "gray", "light_gray", "cyan", "purple", "blue", "brown", "green", "red", "black"];

global GToolSharp as IIngredient = <ore:sharpbone>.reuse().transformDamage() | <ore:toolWorkBlade>.reuse().transformDamage() | <ore:craftingToolKnife>;