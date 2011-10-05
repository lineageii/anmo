if (typeof tpOnce == "undefined") {
    try {
        var _aa = "undefined";
        var _ba = (typeof tocplusWidth == _aa) ? 300 : tocplusWidth;
        var _ca = (typeof tocplusHeight == _aa) ? 150 : tocplusHeight;
        var _da = (typeof tocplusTop == _aa) ? 100 : tocplusTop;
        var _ea = (typeof tocplusLeft == _aa) ? 300 : tocplusLeft;
        var _fa = (typeof tocplusFloatingWindow == _aa) ? true : tocplusFloatingWindow;
        var _ga = (typeof tocplusFrameColor == _aa) ? "orange" : tocplusFrameColor;
        var _ha = (typeof tocplusBgImage == _aa) ? "" : tocplusBgImage;
        var _ia = (typeof tocplusAwayImage == _aa) ? "" : tocplusAwayImage;
        var _ja = (typeof tocplusAwayUrl == _aa) ? "" : tocplusAwayUrl;
        var _ka = (typeof tocplusUserName == _aa) ? "" : escape(escape(tocplusUserName));
        var _la = (typeof tocplusMinimized == _aa) ? false : tocplusMinimized;
        var _ma = (typeof tocplusMinimizedImage == _aa) ? "http://tocplus.com/img/minimized_en.gif" : tocplusMinimizedImage;
        var _na = (typeof tocplusWidget == _aa) ? "" : tocplusWidget;
        var _oa = (typeof tocplusUrl == _aa) ? document.URL : tocplusUrl;
        var _pa = document.referrer;
        var _qa = "http://static.tocplus007.com/static/img";
        if (_na != "") {
            try {
                _oa = parent.document.URL;
                _pa = parent.document.referrer;
            } catch (e) {}
        }
        var _ra = (typeof tocplusHAlign == _aa) ? "left" : tocplusHAlign;
        var _sa;
        var _ta;
        var _ua = "#FFFFFF";
        var _va = _qa + "/titlebar_" + _ga + ".gif";
        if (_ga == "white") {
            _ta = "#D7D7E0";
            _sa = "#FBFDFE";
            _ua = "#7A7A92";
        } else if (_ga == "blue") {
            _ta = "#ACB4D8";
            _sa = "#8793C6";
        } else if (_ga == "green") {
            _ta = "#C9E285";
            _sa = "#A5CE34";
        } else if (_ga == "purple") {
            _ta = "#DFA8EA";
            _sa = "#D17FE0";
        } else if (_ga == "grey") {
            _ta = "#8E8E8E";
            _sa = "#676767";
        } else {
            _ta = "#FFDA63";
            _sa = "#FFB300";
            _va = _qa + "/titlebar_orange.gif";
        }
        var _wa = 0;

        function _xa(nb) {
            var ob = document.body.offsetWidth;
            if ("center" == _ra) {
                ob = _wa > ob ? _wa : ob;
                return (ob - _ba - 10) / 2 + nb;
            }
            if ("right" == _ra) {
                return document.body.offsetWidth - (nb + _ba + 33);
            }
            return nb;
        }

        function _ya(pb) {
            var qb = document.body.offsetWidth;
            if ("center" == _ra) {
                qb = _wa > qb ? _wa : qb;
                return pb - (qb - _ba - 10) / 2;
            }
            if ("right" == _ra) {
                return qb - (pb + _ba + 33);
            }
            return pb;
        }
        var _za;

        function scrollUpdate() {
            var rb = document.documentElement.scrollTop;
            var sb = document.body.scrollTop;
            var tb = rb > sb ? rb : sb;
            _za.style.top = (tb + _da) + "px";
            _za.style.left = _xa(_ea) + "px";
        }

        function _Aa() {
            setTimeout("scrollUpdate()", 3);
        }
        var _Ba = false;
        var _Ca;
        var _Da;
        var _Ea;
        var _Fa;
        var nn6 = document.getElementById && !document.all;

        function _Ga(e) {
            var ev = nn6 ? e : event;
            _Ea = ev.clientX;
            _Fa = ev.clientY;
            _Ca = _Ea - _xa(_ea);
            _Da = _Fa - _da;
            _Ba = true;
            scrollUpdate();
            document.body.focus();
            document.onselectstart = function () {
                return false;
            };
            return false;
        }

        function _Ha() {
            _Ba = false;
            scrollUpdate();
        }

        function _Ia(e) {
            if (_Ba) {
                var ev = nn6 ? e : event;
                _ea = _ya(ev.clientX - _Ca);
                _da = ev.clientY - _Da;
                scrollUpdate();
            }
        }
        var _Ja;
        var _Ka;
        var _La;

        function _Ma(ub, vb, e) {
            ub(e);
            if (vb != null) {
                vb(e);
            }
        }
        var _Na = true;

        function addCommonHandlers() {
            if (_Na) {
                _Ja = document.onmousemove;
                document.onmousemove = function (e) {
                    _Ma(_Ia, _Ja, e);
                };
                _Ka = window.onscroll;
                window.onscroll = function (e) {
                    _Ma(_Aa, _Ka, e);
                };
                _La = window.onresize;
                window.onresize = function (e) {
                    _Ma(_Aa, _La, e);
                };
                _Na = false;
            }
        }
        var _Oa;

        function onTitleOver() {
            _Oa.innerHTML = "TocPlus.co.kr";
            _Oa.style.textDecoration = "underline";
        }

        function onTitleOut() {
            _Oa.innerHTML = "TocPlus";
            _Oa.style.textDecoration = "none";
        }

        function _Pa(wb, xb, yb) {
            var zb = new Date();
            zb.setDate(zb.getDate() + yb);
            document.cookie = wb + "=" + escape(xb) + "; path=/; expires=" + zb.toGMTString() + ";"
        }

        function closeTocplusWindow() {
            _Pa("TocplusWindow", "invisible", 1);
            _Qa();
        }
        var _Ra = false;
        var _Sa;

        function expandTocplusWindow() {
            _Ra = true;
            _ca *= 1.4;
            _ba *= 1.4;
            _Ta();
        }

        function contractTocplusWindow() {
            _ca /= 1.4;
            _ba /= 1.4;
            _Ta();
        }
        var _Ua;

        function _Va() {}

        function _Wa() {
            _Ba = false;
        }

        function sUp() {
            var Ab = document.body.scrollTop;
            if (Ab == 0) {
                document.body.scrollTop = 1;
                scrollUpdate();
                document.body.scrollTop = Ab;
            } else {
                scrollUpdate();
            }
        }

        function _Xa(Bb, Cb) {
            var Db = document.getElementById("TpTbw");
            Db.style.cursor = Cb;
            Db.onmousedown = _Ga;
            Db.onmouseup = Bb;
            Db.ondragstart = _Ga;
            Db.ondrag = _Ia;
            setTimeout("addCommonHandlers()", 900);
            setTimeout("sUp()", 3);
        }

        function emptyTocplusWindow() {}
        var _Ya = 12;
        var _Za = 31;

        function addFrame(Eb) {
            if (_ba < 0) {
                _ba = document.body.clientWidth - _Ya;
            }
            if (_ca < 0) {
                _ca = document.body.clientHeight - _Za;
            }
            if (_ba < 0 || _ca < 0) {
                setTimeout("addFrame('" + Eb + "')", 100);
                return;
            }
            if (_ba < 120) {
                _ba = 120;
            }
            if (_ca < 80) {
                _ca = 80;
            }

            function _$a(Fb) {
                return '<a href="javascript:' + Fb + 'TocplusWindow();"><img style="vertical-align: middle;border: none;width:15px;height:15px;" src="' + _qa + '/' + Fb + '.gif"></a>';
            }
            _za.innerHTML = '\
<div style="word-break:normal; float:left; border:1px solid #555555;">\
<div id="TpTbw" style="border: 1px solid ' + _ta + '; padding:2px; padding-top:3px; background: url(\'' + _va + '\') ' + _sa + ' repeat-x top;">\
<div style="' + (_fa ? 'position:absolute;left:4;top:5' : 'float:left') + '"><a id="eTkZp" style="font-size:12px; padding-left: 4px; color: ' + _ua + '; font-weight: bold; font-family: Arial; text-decoration: none;" href="' + mainServerUrl + '/invitedUser.do?invitorType=title&invitor=' + userId + '" title="' + userId + '" target="_blank">TocPlus</a></div>\
<div style="background: url(\'' + _qa + '/empty.gif\'); text-align:right;padding-right:2px;font-size:12px">' + (_fa ? (_Ra ? _$a("contract") + ' ' : '') + _$a("expand") + ' ' + _$a("close") : _$a("empty")) + '</div>\
<div id="iVCkq" style="margin-top: 3px; background:#666666; padding:1px; ">\
</div></div></div>';
            _Sa = document.createElement('iframe');
            _Sa.src = appRoot;
            _Sa.style.width = _ba + 'px';
            _Sa.style.height = _ca + 'px';
            _Sa.frameBorder = 0;
            _ab = document.getElementById("iVCkq");
            _ab.appendChild(_Sa);
            _Oa = document.getElementById("eTkZp");
            _Oa.onmouseover = onTitleOver;
            _Oa.onmouseout = onTitleOut;
            if (_fa) {
                _Xa(_Ha, "move");
                _Sa.onmouseover = _Va;
                _Sa.onmouseout = _Wa;
            }
        }

        function _bb(Gb) {
            var Hb = Gb + "=";
            var x = 0;
            while (x <= document.cookie.length) {
                var y = (x + Hb.length);
                if (document.cookie.substring(x, y) == Hb) {
                    if ((endOfCookie = document.cookie.indexOf(";", y)) == -1) endOfCookie = document.cookie.length;
                    return unescape(document.cookie.substring(y, endOfCookie));
                }
                x = document.cookie.indexOf(" ", x) + 1;
                if (x == 0) break;
            }
            return "";
        }

        function _cb() {
            if (typeof tocplusTid != _aa) return tocplusTid;
            var Ib = _bb("tid");
            if (!Ib) {
                Ib = new Date().getTime();
                _Pa("tid", Ib, 1);
            }
            return Ib;
        }

        function _db() {
            var Jb = 'userChat.do?userId=' + userId + '&tid=' + _cb() + '&frameColor=' + _ga + '&userName=' + _ka + '&bgImage=' + escape(_ha);
            if (_na == "") {
                Jb += '&url=' + escape(_oa.substring(0, 140)) + '&ref=' + escape(_pa.substring(0, 120));
            } else {
                Jb += '&url=' + escape(_oa.substring(0, 50)) + '&ref=' + escape(_pa.substring(0, 100));
            }
            Jb += '&dumb=' + (new Date().getTime());
            addFrame(Jb);
        }

        function _eb() {
            var Kb = new Date().getTime() - userCreated;
            Kb /= (1000 * 60 * 60 * 24);
            var Lb = 'awayMessage.do?l=' + Math.floor(Kb) + '&dumb=' + (new Date().getTime());
            if (_ia != '') {
                Lb += '&awayImage=' + _ia;
            }
            if (_ja != '' && _ja.substr(0, 4) == "http") {
                Lb += '&awayLink=' + _ja;
            }
            addFrame(Lb);
        }

        function _fb() {
            addFrame('wrongHost.do');
        }

        function _gb() {
            _Pa("TocplusWindow", "visible", 1);
            _Ta();
        }

        function _hb(e) {
            var ev = nn6 ? e : event;
            _Ha();
            if (_Ea == ev.clientX && _Fa == ev.clientY) {
                _gb();
            }
        }

        function showNoFloatTocplus() {
            _gb();
        }

        function _Qa() {
            var Mb = '<img src="' + _ma + '" style="border:none"/>';
            if (!_fa) {
                Mb = '<a href="javascript:showNoFloatTocplus();">' + Mb + '</a>';
            }
            _za.innerHTML = '<div id="TpTbw" style="border:none;">' + Mb + '</div>';
            if (_fa) {
                _Xa(_hb, "pointer");
            }
        }

        function _Ta() {
            var Nb = _bb("TocplusWindow");
            if (Nb.length == 0 && _la) {
                closeTocplusWindow();
                return;
            }
            if (userId.substring(0, 4) == 'test') {
                _db();
            } else if (Nb == "invisible") {
                _Qa();
            } else if (wrongHost) {
                _fb();
            } else if (managerAway) {
                _eb();
            } else {
                _db();
            }
        }
        var _ib = false;

        function stu() {
            _Ta();
        }
        var _jb = '<div id="tocplusWindow" style="display:block; width:100%;"></div>';
        if (_na == "wb" || _na == "appf") {
            _ib = true;
            document.write(_jb);
            _za = document.getElementById("tocplusWindow");
            setTimeout("stu()", 500);
        }

        function _kb() {
            var Ob = 460;
            if (document.body && document.body.offsetWidth) {
                Ob = document.body.offsetHeight;
            }
            if (document.compatMode == 'CSS1Compat' && document.documentElement && document.documentElement.offsetWidth) {
                Ob = document.documentElement.offsetHeight;
            }
            if (window.innerWidth && window.innerHeight) {
                Ob = window.innerHeight;
            }
            return Ob;
        }

        function rtdiv() {
            if (_ib) {
                return;
            }
            _ib = true;
            _wa = document.body.scrollWidth;
            if (_wa < 0 || _wa == document.body.clientWidth) {
                _wa = 0;
            }
            if (_wa > 1500) {
                _wa = 1500;
            }
            var Pb = document.createElement('div');
            if (_fa) {
                var Qb = _kb();
                var Rb = _da + _ca + 48;
                if (Rb > Qb) {
                    _da += Qb - Rb;
                }
                Pb.innerHTML = '<div id="tocplusWindow" style="z-index: 10000; position:absolute; top:' + _da + 'px; left:' + _xa(_ea) + 'px"></div>';
            } else {
                Pb.innerHTML = _jb;
            }
            document.body.appendChild(Pb);
            _za = document.getElementById("tocplusWindow");
            setTimeout("stu()", 500);
        }

        function _mb(Sb) {
            var Tb = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = Sb;
            } else {
                window.onload = function () {
                    Sb();
                    if (Tb) {
                        Tb();
                    }
                }
            }
        }
        _mb(rtdiv);
        setTimeout("rtdiv()", 5000);
    } catch (e) {}
}
var tpOnce = true;