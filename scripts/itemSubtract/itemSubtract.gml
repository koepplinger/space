/// @function	itemSubtract(name);
/// @param		{string}	name	The name of the item to destroy
/// @param		{real}		amount	The amount of the item to destroy
function itemSubtract(name,amount){
	for (var h=0;h<ROWS;++h;){
		for (var w=0;w<COLS;++w;){
			var slot=inv[#w,h];
			if slot!=EMPTY{
				if name==slot[?"name"]{
					if !slot[?"stackable"] inv[#w,h]=EMPTY;
					else{
						slot[?"amount"]-=amount;
						if slot[?"amount"]<1 inv[#w,h]=EMPTY;
					}
					exit;
				}
			}
		}
	}
	
}