#loader preInit

import contentcreator.item.Item;
import contentcreator.item.SubItem;

static META as int = 0;

function meta() as int {
       val meta as int = META;
       META = META + 1;
}

function sub(name as string) as SubItem {
       return Item.sub(meta()).setUnlocalizedName(name);
}

Item.create("material").add(sub("valus_twine"), sub("twig"), sub("twig_yew"), sub("twig_ironwood"), sub("spider_twine"), sub("rock_pick_head"), sub("rock_axe_head"), sub("rock_hoe_head"), sub("rock_shovel_head"), sub("rock_hammer_head"), sub("wood_plating"), sub("worktable_grid")).register();