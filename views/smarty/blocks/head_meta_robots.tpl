[{if $oxcmp_shop->oxshops__cmconsentmanagerpid->value}]
    [{if $oxcmp_shop->oxshops__cmconsentmanagercustomhtml->value}][{$oxcmp_shop->oxshops__cmconsentmanagercustomhtml->getRawValue()}][{/if}]
    [{if $oxcmp_shop->oxshops__cmconsentmanagerblockingmode->value}]
        [{capture name="d3JsFnc"}][{strip}]
            if(!("gdprAppliesGlobally" in window)){window.gdprAppliesGlobally=true}
            if(!("cmp_id" in window)||window.cmp_id<1){window.cmp_id=0}
            if(!("cmp_cdid" in window)){window.cmp_cdid="[{$oxcmp_shop->oxshops__cmconsentmanagerpid->value}]"}
            if(!("cmp_params" in window)){window.cmp_params=""}
            if(!("cmp_host" in window)){window.cmp_host="a.delivery.consentmanager.net"}
            if(!("cmp_cdn" in window)){window.cmp_cdn="cdn.consentmanager.net"}
            if(!("cmp_proto" in window)){window.cmp_proto="https:"}
            if(!("cmp_codesrc" in window)){window.cmp_codesrc="1"}
            window.cmp_getsupportedLangs=function(){var b=["DE","EN","FR","IT","NO","DA","FI","ES","PT","RO","BG","ET","EL","GA","HR","LV","LT","MT","NL","PL","SV","SK","SL","CS","HU","RU","SR","ZH","TR","UK","AR","BS"];if("cmp_customlanguages" in window){for(var a=0;a<window.cmp_customlanguages.length;a++){b.push(window.cmp_customlanguages[a].l.toUpperCase())}}return b};
            window.cmp_getRTLLangs=function(){var a=["AR"];if("cmp_customlanguages" in window){for(var b=0;b<window.cmp_customlanguages.length;b++){if("r" in window.cmp_customlanguages[b]&&window.cmp_customlanguages[b].r){a.push(window.cmp_customlanguages[b].l)}}}return a};
            window.cmp_getlang=function(j){if(typeof(j)!="boolean"){j=true}if(j&&typeof(cmp_getlang.usedlang)=="string"&&cmp_getlang.usedlang!==""){return cmp_getlang.usedlang}var g=window.cmp_getsupportedLangs();var c=[];var f=location.hash;var e=location.search;var a="languages" in navigator?navigator.languages:[];if(f.indexOf("cmplang=")!=-1){c.push(f.substr(f.indexOf("cmplang=")+8,2).toUpperCase())}else{if(e.indexOf("cmplang=")!=-1){c.push(e.substr(e.indexOf("cmplang=")+8,2).toUpperCase())}else{if("cmp_setlang" in window&&window.cmp_setlang!=""){c.push(window.cmp_setlang.toUpperCase())}else{if(a.length>0){for(var d=0;d<a.length;d++){c.push(a[d])}}}}}if("language" in navigator){c.push(navigator.language)}if("userLanguage" in navigator){c.push(navigator.userLanguage)}var h="";for(var d=0;d<c.length;d++){var b=c[d].toUpperCase();if(g.indexOf(b)!=-1){h=b;break}if(b.indexOf("-")!=-1){b=b.substr(0,2)}if(g.indexOf(b)!=-1){h=b;break}}if(h==""&&typeof(cmp_getlang.defaultlang)=="string"&&cmp_getlang.defaultlang!==""){return cmp_getlang.defaultlang}else{if(h==""){h="EN"}}h=h.toUpperCase();return h};
            (function(){var y=document;var z=y.getElementsByTagName;var j=window;var r="";var b="_en";if("cmp_getlang" in j){r=j.cmp_getlang().toLowerCase();if("cmp_customlanguages" in j){var g=j.cmp_customlanguages;for(var u=0;u<g.length;u++){if(g[u].l.toLowerCase()==r){r="en";break}}}b="_"+r}function A(e,D){e+="=";var d="";var m=e.length;var i=location;var E=i.hash;var w=i.search;var s=E.indexOf(e);var C=w.indexOf(e);if(s!=-1){d=E.substring(s+m,9999)}else{if(C!=-1){d=w.substring(C+m,9999)}else{return D}}var B=d.indexOf("&");if(B!=-1){d=d.substring(0,B)}return d}var n=("cmp_proto" in j)?j.cmp_proto:"https:";if(n!="http:"&&n!="https:"){n="https:"}var h=("cmp_ref" in j)?j.cmp_ref:location.href;if(h.length>300){h=h.substring(0,300)}var k=y.createElement("script");k.setAttribute("data-cmp-ab","1");var c=A("cmpdesign","cmp_design" in j?j.cmp_design:"");var f=A("cmpregulationkey","cmp_regulationkey" in j?j.cmp_regulationkey:"");var v=A("cmpgppkey","cmp_gppkey" in j?j.cmp_gppkey:"");var p=A("cmpatt","cmp_att" in j?j.cmp_att:"");k.src=n+"//"+j.cmp_host+"/delivery/cmp.php?"+("cmp_id" in j&&j.cmp_id>0?"id="+j.cmp_id:"")+("cmp_cdid" in j?"&cdid="+j.cmp_cdid:"")+"&h="+encodeURIComponent(h)+(c!=""?"&cmpdesign="+encodeURIComponent(c):"")+(f!=""?"&cmpregulationkey="+encodeURIComponent(f):"")+(v!=""?"&cmpgppkey="+encodeURIComponent(v):"")+(p!=""?"&cmpatt="+encodeURIComponent(p):"")+("cmp_params" in j?"&"+j.cmp_params:"")+(y.cookie.length>0?"&__cmpfcc=1":"")+"&l="+r.toLowerCase()+"&o="+(new Date()).getTime();k.type="text/javascript";k.async=true;if(y.currentScript&&y.currentScript.parentElement){y.currentScript.parentElement.appendChild(k)}else{if(y.body){y.body.appendChild(k)}else{var q=["body","div","span","script","head"];for(var u=0;u<q.length;u++){var x=z(q[u]);if(x.length>0){x[0].appendChild(k);break}}}}var o="js";var t=A("cmpdebugunminimized","cmpdebugunminimized" in j?j.cmpdebugunminimized:0)>0?"":".min";var a=A("cmpdebugcoverage","cmp_debugcoverage" in j?j.cmp_debugcoverage:"");if(a=="1"){o="instrumented";t=""}var k=y.createElement("script");k.src=n+"//"+j.cmp_cdn+"/delivery/"+o+"/cmp"+b+t+".js";k.type="text/javascript";k.setAttribute("data-cmp-ab","1");k.async=true;if(y.currentScript&&y.currentScript.parentElement){y.currentScript.parentElement.appendChild(k)}else{if(y.body){y.body.appendChild(k)}else{var x=z("body");if(x.length==0){x=z("div")}if(x.length==0){x=z("span")}if(x.length==0){x=z("ins")}if(x.length==0){x=z("script")}if(x.length==0){x=z("head")}if(x.length>0){x[0].appendChild(k)}}}})();
            window.cmp_addFrame=function(b){if(!window.frames[b]){if(document.body){var a=document.createElement("iframe");a.style.cssText="display:none";if("cmp_cdn" in window&&"cmp_ultrablocking" in window&&window.cmp_ultrablocking>0){a.src="//"+window.cmp_cdn+"/delivery/empty.html"}a.name=b;a.setAttribute("title","Intentionally hidden, please ignore");a.setAttribute("role","none");a.setAttribute("tabindex","-1");document.body.appendChild(a)}else{window.setTimeout(window.cmp_addFrame,10,b)}}};
            window.cmp_rc=function(c,b){var j=document.cookie;var g="";var e=0;var f=false;while(j!=""&&e<100){e++;while(j.substr(0,1)==" "){j=j.substr(1,j.length)}var h=j.substring(0,j.indexOf("="));if(j.indexOf(";")!=-1){var k=j.substring(j.indexOf("=")+1,j.indexOf(";"))}else{var k=j.substr(j.indexOf("=")+1,j.length)}if(c==h){g=k;f=true}var d=j.indexOf(";")+1;if(d==0){d=j.length}j=j.substring(d,j.length)}if(!f&&typeof(b)=="string"){g=b}return(g)};
            window.cmp_stub=function(){var a=arguments;__cmp.a=__cmp.a||[];if(!a.length){return __cmp.a}else{if(a[0]==="ping"){if(a[1]===2){a[2]({gdprApplies:gdprAppliesGlobally,cmpLoaded:false,cmpStatus:"stub",displayStatus:"hidden",apiVersion:"2.2",cmpId:31},true)}else{a[2](false,true)}}else{if(a[0]==="getUSPData"){a[2]({version:1,uspString:window.cmp_rc("__cmpccpausps","1---")},true)}else{if(a[0]==="getTCData"){__cmp.a.push([].slice.apply(a))}else{if(a[0]==="addEventListener"||a[0]==="removeEventListener"){__cmp.a.push([].slice.apply(a))}else{if(a.length==4&&a[3]===false){a[2]({},false)}else{__cmp.a.push([].slice.apply(a))}}}}}}};
            window.cmp_gpp_ping=function(){return{gppVersion:"1.1",cmpStatus:"stub",cmpDisplayStatus:"hidden",signalStatus:"not ready",supportedAPIs:["5:tcfcav1","7:usnat","8:usca","9:usva","10:usco","11:usut","12:usct"],cmpId:31,sectionList:[],applicableSections:[0],gppString:"",parsedSections:{}}};
            window.cmp_gppstub=function(){var c=arguments;__gpp.q=__gpp.q||[];if(!c.length){return __gpp.q}var h=c[0];var g=c.length>1?c[1]:null;var f=c.length>2?c[2]:null;var a=null;var j=false;if(h==="ping"){a=window.cmp_gpp_ping();j=true}else{if(h==="addEventListener"){__gpp.e=__gpp.e||[];if(!("lastId" in __gpp)){__gpp.lastId=0}__gpp.lastId++;var d=__gpp.lastId;__gpp.e.push({id:d,callback:g});a={eventName:"listenerRegistered",listenerId:d,data:true,pingData:window.cmp_gpp_ping()};j=true}else{if(h==="removeEventListener"){__gpp.e=__gpp.e||[];a=false;for(var e=0;e<__gpp.e.length;e++){if(__gpp.e[e].id==f){__gpp.e[e].splice(e,1);a=true;break}}j=true}else{__gpp.q.push([].slice.apply(c))}}}if(a!==null&&typeof(g)==="function"){g(a,j)}};
            window.cmp_msghandler=function(d){var a=typeof d.data==="string";try{var c=a?JSON.parse(d.data):d.data}catch(f){var c=null}if(typeof(c)==="object"&&c!==null&&"__cmpCall" in c){var b=c.__cmpCall;window.__cmp(b.command,b.parameter,function(h,g){var e={__cmpReturn:{returnValue:h,success:g,callId:b.callId}};d.source.postMessage(a?JSON.stringify(e):e,"*")})}if(typeof(c)==="object"&&c!==null&&"__uspapiCall" in c){var b=c.__uspapiCall;window.__uspapi(b.command,b.version,function(h,g){var e={__uspapiReturn:{returnValue:h,success:g,callId:b.callId}};d.source.postMessage(a?JSON.stringify(e):e,"*")})}if(typeof(c)==="object"&&c!==null&&"__tcfapiCall" in c){var b=c.__tcfapiCall;window.__tcfapi(b.command,b.version,function(h,g){var e={__tcfapiReturn:{returnValue:h,success:g,callId:b.callId}};d.source.postMessage(a?JSON.stringify(e):e,"*")},b.parameter)}if(typeof(c)==="object"&&c!==null&&"__gppCall" in c){var b=c.__gppCall;window.__gpp(b.command,function(h,g){var e={__gppReturn:{returnValue:h,success:g,callId:b.callId}};d.source.postMessage(a?JSON.stringify(e):e,"*")},"parameter" in b?b.parameter:null,"version" in b?b.version:1)}};
            window.cmp_setStub=function(a){if(!(a in window)||(typeof(window[a])!=="function"&&typeof(window[a])!=="object"&&(typeof(window[a])==="undefined"||window[a]!==null))){window[a]=window.cmp_stub;window[a].msgHandler=window.cmp_msghandler;window.addEventListener("message",window.cmp_msghandler,false)}};
            window.cmp_setGppStub=function(a){if(!(a in window)||(typeof(window[a])!=="function"&&typeof(window[a])!=="object"&&(typeof(window[a])==="undefined"||window[a]!==null))){window[a]=window.cmp_gppstub;window[a].msgHandler=window.cmp_msghandler;window.addEventListener("message",window.cmp_msghandler,false)}};
            window.cmp_addFrame("__cmpLocator");
            if(!("cmp_disableusp" in window)||!window.cmp_disableusp){window.cmp_addFrame("__uspapiLocator")}
            if(!("cmp_disabletcf" in window)||!window.cmp_disabletcf){window.cmp_addFrame("__tcfapiLocator")}
            if(!("cmp_disablegpp" in window)||!window.cmp_disablegpp){window.cmp_addFrame("__gppLocator")}
            window.cmp_setStub("__cmp");
            if(!("cmp_disabletcf" in window)||!window.cmp_disabletcf){window.cmp_setStub("__tcfapi")}
            if(!("cmp_disableusp" in window)||!window.cmp_disableusp){window.cmp_setStub("__uspapi")}
            if(!("cmp_disablegpp" in window)||!window.cmp_disablegpp){window.cmp_setGppStub("__gpp")};
        [{/strip}][{/capture}]
        [{oxscript add=$smarty.capture.d3JsFnc}]
    [{else}]
        <script type="text/javascript" data-cmp-ab="1" src="https://cdn.consentmanager.net/delivery/autoblocking/[{$oxcmp_shop->oxshops__cmconsentmanagerpid->value}].js" data-cmp-host="a.delivery.consentmanager.net" data-cmp-cdn="cdn.consentmanager.net" data-cmp-codesrc="1"></script>
    [{/if}]
[{/if}]
[{$smarty.block.parent}]