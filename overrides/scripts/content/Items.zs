#loader preInit

import contentcreator.item.Item;
import contentcreator.item.ValueItem;

static META as int = 0;

function meta() as int {
       val meta as int = META;
       META = META + 1;
}

function value(name as string) as ValueItem {
       return ValueItem.create(meta()).setUnlocalizedName(name);
}

Item.create("material").addItem(value("valus_twine"), value("twig"), value("twig_yew"), value("twig_ironwood"), value("spider_twine"), value("rock_pick_head"), value("rock_axe_head"), value("rock_hoe_head"), value("rock_shovel_head"), value("rock_hammer_head")).register();