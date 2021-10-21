//function CheckCity(Cvalue){
//	if(Cvalue=='184'){
//		document.getElementById('city1').style.display='block';
//		document.getElementById('city1').disabled=false;
//		document.getElementById('city2').style.display='none';
//		document.getElementById('city2').disabled=true;
//	}else{
//		document.getElementById('city1').style.display='none';
//		document.getElementById('city1').disabled=true;
//		document.getElementById('city2').style.display='block';
//		document.getElementById('city2').disabled=false;
//	}
//}

sfInit = function() {
	var sfEls = document.getElementById("nav2").getElementsByTagName("li");
	for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover= function (){
			this.className+=" sfhover";	
		}
		sfEls[i].onmouseout = function (){
			this.className=this.className.replace(new RegExp(" sfhover\\b"), "");
		}
	}
}

if (window.attachEvent) window.attachEvent("onload", sfInit);

//function txtmesajsay2(sayi,name,counter){
// document.mainfrm[counter].value=sayi-document.mainfrm[name].value.length;
// if (document.mainfrm[counter].value<='0')
// 	{alert(sayi+' karakter girebilirsiniz enfazla!');
//	document.mainfrm[name].value=document.mainfrm[name].value.substr(0,sayi);
//	document.mainfrm[counter].value=0;
//	return false;
//	}
// else
//	return true;
//}
//function txtmesajsay(sayi,name,counter){
// document.frm[counter].value=sayi-document.frm[name].value.length;
// if (document.frm[counter].value<='0')
// 	{alert(sayi+' karakter girebilirsiniz enfazla!');
//	document.frm[name].value=document.frm[name].value.substr(0,sayi);
//	document.frm[counter].value=0;
//	return false;
//	}
// else
//	return true;
//}

//function PopUp2(whatURL,uz,yu) {
//        var win = window.open( whatURL,"ProjView","scrollbars=yes,toolbar=no,status=no,width="+uz+",height="+yu+"");
//					if(window.focus)
//				{
//					win.focus()
//				}	
//}
//function AcKapa(ID,Sy){
//		var i=0;

//		if(document.all['dCat'+ID].style.display == 'block'){
//			document.all['dCat'+ID].style.display='none';
//			document.getElementById("FolderImage"+ID).src = '/images/FolderUp.gif';			

//		}else{		
//			for(i=1;i<Sy+1;i++)
//			{
//				document.all['dCat'+i].style.display='none';
//				document.getElementById("FolderImage"+i).src = '/images/FolderUp.gif';
//			}	
//			document.all['dCat'+ID].style.display='block';
//			document.getElementById("FolderImage"+ID).src = '/images/FolderOpened.gif';
//		}
//}