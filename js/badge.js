!(function (e) {
    function n(i) {
        if (t[i]) return t[i].exports;
        var s = (t[i] = { i: i, l: !1, exports: {} });
        return e[i].call(s.exports, s, s.exports, n), (s.l = !0), s.exports;
    }
    var t = {};
    (n.m = e),
        (n.c = t),
        (n.d = function (e, t, i) {
            n.o(e, t) || Object.defineProperty(e, t, { configurable: !1, enumerable: !0, get: i });
        }),
        (n.n = function (e) {
            var t =
                e && e.__esModule
                    ? function () {
                          return e.default;
                      }
                    : function () {
                          return e;
                      };
            return n.d(t, "a", t), t;
        }),
        (n.o = function (e, n) {
            return Object.prototype.hasOwnProperty.call(e, n);
        }),
        (n.p = ""),
        n((n.s = 0));
})([
    function (e, n, t) {
        "use strict";
        Object.defineProperty(n, "__esModule", { value: !0 });
        var i = t(1),
            s = (t.n(i), t(2)),
            r = t(6),
            o = t(8);
        if (!window.__dimensions_embed) {
            var a = function () {
                    window.__dimensions_detail_url || (window.__dimensions_detail_url = "https://badge.dimensions.ai"),
                        window.__dimensions_metrics_api || (window.__dimensions_metrics_api = "https://metrics-api.dimensions.ai"),
                        window.__dimensions_badge_server || (window.__dimensions_badge_server = "https://badge.dimensions.ai"),
                        window.__dimensions_badge_url || (window.__dimensions_badge_url = "https://badge.dimensions.ai"),
						// MODIFICADO URL ESTETICA BADGE DIMENSIONS
						window.__dimensions_badge_url_local || (window.__dimensions_badge_url_local = "/plugins/themes/saludColectiva/css");
                },
                c = function () {
                    var e = document.querySelectorAll(".__dimensions_badge_embed__");
                    if (e.length)
                        for (var n = 0; n < e.length; ++n)
                            !(function (n) {
                                var t = new r.a(e[n].attributes, window.__dimensions_detail_url, window.__dimensions_metrics_api, window.__dimensions_badge_server);
                                new o.a(t.metricsURL).fetch(function (i) {
                                    new s.a(e[n], t, i).load();
                                });
                            })(n);
                },
                d = function () {
                    var e = document.createElement("link");
                    (e.rel = "stylesheet"), (e.href = window.__dimensions_badge_url_local + "/badge.css"), document.getElementsByTagName("head")[0].appendChild(e);
                },
                l = function () {
                    window.__dimensions_embed_installed__ || ((window.__dimensions_embed_installed__ = !0), a(), d(), c());
                };
            (document.attachEvent ? "complete" === document.readyState : "loading" !== document.readyState)
                ? l()
                : (document.addEventListener("DOMContentLoaded", l),
                  (document.onreadystatechange = function () {
                      "complete" === document.readyState && l();
                  })),
                (window.__dimensions_embed = { addBadges: c });
        }
    },
    function (e, n) {},
    function (e, n, t) {
        "use strict";
        function i(e, n) {
            if (!(e instanceof n)) throw new TypeError("Cannot call a class as a function");
        }
        var s = t(3),
            r = t.n(s),
            o = t(4),
            a = t.n(o),
            c = t(5),
            d = (function () {
                function e(e, n) {
                    for (var t = 0; t < n.length; t++) {
                        var i = n[t];
                        (i.enumerable = i.enumerable || !1), (i.configurable = !0), "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i);
                    }
                }
                return function (n, t, i) {
                    return t && e(n.prototype, t), i && e(n, i), n;
                };
            })(),
            l = (function () {
                function e(n, t, s) {
                    var r = this;
                    i(this, e),
                        Object.defineProperty(this, "onMouseOver", {
                            enumerable: !0,
                            writable: !0,
                            value: function () {
                                if (((r.badgeComponent.className = "__dimensions_Badge __dimensions_Badge_style_" + r.config.badgeType + " __dimensions_Badge_hover"), r.legendComponent))
                                    switch (r.config.legendDisplay) {
                                        case "always":
                                        case "never":
                                            return;
                                        case "hover-top":
                                        case "hover-right":
                                        case "hover-bottom":
                                        case "hover-left":
                                            r.legendComponent.className =
                                                "__dimensions_Badge_Legend_padding __dimensions_Badge_Legend_hover __dimensions_Badge_Legend_" + r.config.legendDisplay + "  __dimensions_Badge_Legend_style_" + r.config.badgeType;
                                            break;
                                        case "hover-auto":
                                            r.legendComponent.className =
                                                "__dimensions_Badge_Legend_padding __dimensions_Badge_Legend_hover __dimensions_Badge_Legend_hover-" + r.optimalHoverDirection + "  __dimensions_Badge_Legend_style_" + r.config.badgeType;
                                    }
                            },
                        }),
                        Object.defineProperty(this, "onMouseOut", {
                            enumerable: !0,
                            writable: !0,
                            value: function () {
                                if (((r.badgeComponent.className = "__dimensions_Badge __dimensions_Badge_style_" + r.config.badgeType), r.legendComponent))
                                    switch (r.config.legendDisplay) {
                                        case "always":
                                        case "never":
                                            return;
                                        default:
                                            r.legendComponent.className = "__dimensions_Badge_Legend_padding  __dimensions_Badge_Legend_style_" + r.config.badgeType;
                                    }
                            },
                        }),
                        Object.defineProperty(this, "trigger", {
                            enumerable: !0,
                            writable: !0,
                            value: function (e) {
                                window.setTimeout(function () {
                                    var n = document.createEvent("Event");
                                    n.initEvent(e, !0, !0), r.component.dispatchEvent(n);
                                });
                            },
                        }),
                        (this.component = n),
                        (this.config = t),
                        (this.metrics = s),
                        (this.id = Math.random().toString(36).substring(7));
                }
                return (
                    d(e, [
                        {
                            key: "load",
                            value: function () {
                                if (this.supportsSVG() && !this.alreadyInstalled && !this.noIdentifiers) {
                                    if (this.hidden) return void this.trigger("dimensions_embed:hide");
                                    this.buildElements(), this.installElements(), this.trigger("dimensions_embed:show");
                                }
                            },
                        },
                        {
                            key: "supportsSVG",
                            value: function () {
                                return !!("createElementNS" in document && document.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect) && this.testGradient();
                            },
                        },
                        {
                            key: "testGradient",
                            value: function () {
                                var e = document.createElement("temp");
                                return (e.style.cssText = "background-image:linear-gradient(black,white),radial-gradient(black,white)"), "" !== e.style.backgroundImage;
                            },
                        },
                        {
                            key: "buildElements",
                            value: function () {
                                (this.wrapperComponent = this.buildWrapper()), (this.badgeComponent = this.buildBadge()), (this.legendComponent = this.buildLegend());
                            },
                        },
                        {
                            key: "installElements",
                            value: function () {
                                this.badgeComponent && this.wrapperComponent.appendChild(this.badgeComponent),
                                    this.legendComponent && this.wrapperComponent.appendChild(this.legendComponent),
                                    this.component.appendChild(this.wrapperComponent),
                                    this.component.setAttribute("data-dimensions-badge-installed", !0);
                            },
                        },
                        {
                            key: "buildWrapper",
                            value: function () {
                                var e = this,
                                    n = document.createElement("a");
                                return (
                                    (n.className = "__dimensions_Link"),
                                    (n.href = this.config.detailPageURL),
                                    (n.target = "_blank"),
                                    (n.style.display = "none"),
									// MODIFICADO TITULO DIMENSIONS
									(n.innerHTML = "<br><b style=\"font-size: 18px; font-weight: 600;\">Dimensions</b><br><br><br>"),
                                    n.setAttribute("referrerpolicy", "no-referrer-when-downgrade"),
                                    n.addEventListener("focus", this.onMouseOver),
                                    n.addEventListener("blur", this.onMouseOut),
                                    n.addEventListener("mouseover", this.onMouseOver),
                                    n.addEventListener("mouseout", this.onMouseOut),
                                    window.addEventListener("touchstart", function () {
                                        n.removeEventListener("mouseover", e.onMouseOver), n.removeEventListener("mouseout", e.onMouseOut), n.removeEventListener("focus", e.onMouseOver), n.removeEventListener("blur", e.onMouseOut);
                                    }),
                                    n
                                );
                            },
                        },
                        {
                            key: "buildBadge",
                            value: function () {
                                var e = this.template,
                                    n = 1 === this.metrics.timesCited ? "CITATION" : "CITATIONS",
                                    t = this.textContent.length > 3 ? "small" : "normal",
                                    i = e
                                        .replace(/\{\{SCORE\}\}/g, this.textContent)
                                        .replace(/\{\{SIZE\}\}/g, t)
                                        .replace(/\{\{LABEL\}\}/g, n)
                                        .replace(/\{\{ID\}\}/g, this.id)
                                        .replace(/\{\{BADGE_SERVER_URL\}\}/g, this.config.badgeServerURL)
                                        .replace(/\{\{ALT_SCORE\}\}/g, this.altScoreText),
                                    s = document.createElement("div");
                                return (s.className = "__dimensions_Badge __dimensions_Badge_style_" + this.config.badgeType), (s.innerHTML = i), s;
                            },
                        },
                        {
                            key: "buildLegend",
                            value: function () {
                                if (!this.legendHidden) {
                                    var e = document.createElement("div");
                                    (e.className = "__dimensions_Badge_Legend_padding __dimensions_Badge_Legend_hover-right  __dimensions_Badge_Legend_style_" + this.config.badgeType),
                                        this.legendAlwaysVisible && (e.className += " __dimensions_Badge_Legend_always");
                                    var n = document.createElement("div");
                                    return (
                                        (n.className = "__dimensions_Badge_Legend"),
                                        e.appendChild(n),
                                        (n.innerHTML =
                                            "\n      <div class='__dimensions_Badge_stat_group __dimensions_Badge_stat_group_citations'>\n        <div class='__dimensions_Badge_stat __dimensions_Badge_stat_total_citations'>\n          <span class='__dimensions_Badge_stat_icon'></span>\n          <span class='__dimensions_Badge_stat_count'>" +
                                            Object(c.b)(this.timesCited) +
                                            "</span>\n          <span class='__dimensions_Badge_stat_text'>Total " +
                                            (1 == this.timesCited ? "citation" : "citations") +
                                            "</span>\n        </div>\n        <div class='__dimensions_Badge_stat __dimensions_Badge_stat_recent_citations'>\n          <span class='__dimensions_Badge_stat_icon'></span>\n          <span class='__dimensions_Badge_stat_count'>" +
                                            Object(c.b)(this.recentCitations) +
                                            "</span>\n          <span class='__dimensions_Badge_stat_text'>Recent " +
                                            (1 == this.recentCitations ? "citation" : "citations") +
                                            "</span>\n        </div>\n      </div>\n      <div class=\"__dimensions_Badge_stat_group __dimensions_Badge_stat_group_cr\">\n        <div class='__dimensions_Badge_stat __dimensions_Badge_stat_fcr'>\n          <span class='__dimensions_Badge_stat_icon'></span>\n          <span class='__dimensions_Badge_stat_count'>" +
                                            Object(c.a)(this.metrics.fcr) +
                                            "</span>\n          <span class='__dimensions_Badge_stat_text'>Field Citation Ratio</span>\n        </div>\n        <div class='__dimensions_Badge_stat __dimensions_Badge_stat_rcr'>\n          <span class='__dimensions_Badge_stat_icon'></span>\n          <span class='__dimensions_Badge_stat_count'>" +
                                            Object(c.a)(this.metrics.rcr) +
                                            "</span>\n          <span class='__dimensions_Badge_stat_text'>Relative Citation Ratio</span>\n        </div>\n      </div>"),
                                        e
                                    );
                                }
                            },
                        },
                        {
                            key: "template",
                            get: function () {
                                switch (this.config.badgeType) {
                                    case "small_circle":
                                    case "medium_circle":
                                    case "large_circle":
                                    default:
                                        return r.a;
                                    case "small_rectangle":
                                    case "large_rectangle":
                                        return a.a;
                                }
                            },
                        },
                        {
                            key: "hidden",
                            get: function () {
                                return this.config.hideWhenZeroCitations && (this.noMetrics || this.noCitations);
                            },
                        },
                        {
                            key: "alreadyInstalled",
                            get: function () {
                                return this.component.hasAttribute("data-dimensions-badge-installed");
                            },
                        },
                        {
                            key: "textContent",
                            get: function () {
                                return this.noMetrics ? "?" : Object(c.b)(this.metrics.timesCited);
                            },
                        },
                        {
                            key: "noCitations",
                            get: function () {
                                return this.metrics.timesCited < 1;
                            },
                        },
                        {
                            key: "noMetrics",
                            get: function () {
                                return !this.metrics.exists;
                            },
                        },
                        {
                            key: "noIdentifiers",
                            get: function () {
                                return !this.config.hasAnyIdentifiers;
                            },
                        },
                        {
                            key: "legendHidden",
                            get: function () {
                                return "never" === this.config.legendDisplay;
                            },
                        },
                        {
                            key: "legendAlwaysVisible",
                            get: function () {
                                return "always" === this.config.legendDisplay;
                            },
                        },
                        {
                            key: "timesCited",
                            get: function () {
                                return this.noMetrics ? "?" : Object(c.b)(this.metrics.timesCited);
                            },
                        },
                        {
                            key: "recentCitations",
                            get: function () {
                                return this.noMetrics ? "?" : Object(c.b)(this.metrics.recentCitations);
                            },
                        },
                        {
                            key: "optimalHoverDirection",
                            get: function () {
                                return this.badgeComponent.getBoundingClientRect().x > window.innerWidth / 2 ? "left" : "right";
                            },
                        },
                        {
                            key: "altScoreText",
                            get: function () {
                                return 1 === this.metrics.timesCited ? "1 citation on Dimensions." : this.textContent + " total citations on Dimensions.";
                            },
                        },
                    ]),
                    e
                );
            })();
        n.a = l;
    },
    function (e, n) {
        e.exports =
            '<div class="__dimensions_Badge_Image">\n  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600">\n    <defs>\n      <filter id="{{ID}}-blur" color-interpolation-filters="sRGB">\n        <feGaussianBlur in="SourceGraphic" stdDeviation="40" />\n      </filter>\n      <mask id=\'{{ID}}-shape-mask\'>\n        <path fill=\'white\' d="M546.5,287.3l-111.8-194c-1.8-3-4.1-5.6-6.7-7.7c-2.2-2.7-5.4-4.3-8.9-4.5c-2.3-0.7-4.7-1-7-1\n          L188.2,80c-9.3,0-18,5-22.6,13.1l-112,193.8c-4.7,8.1-4.7,18,0,26.1l111.9,193.9c4.7,8.1,13.3,13,22.6,13.1l223.9,0.1\n          c9.3,0,17.9-4.8,22.6-12.8l112-193.7l0,0C551.1,305.1,551.2,295.4,546.5,287.3z M516.6,287.4l-41.5,0.1l-26.7-118.2L516.6,287.4z\n           M337.2,106.2l-114.5,36.3l-20.3-36.4L337.2,106.2z M180.7,119l20.1,36.2L112,237.7L180.7,119z M181,481.8l-69.3-120l89.2,84\n          L181,481.8z M203.3,493.8l19.6-35.6l114.6,35.7L203.3,493.8z M408.1,489.3l-152.7-47.5l-32.3-10.6l-25.3-23.2L82.6,299.6\n          l114.6-106.9l25-23.1v-0.2l0.7-0.2l32.4-10.7l153.6-48.7l35.5,156.6l7.5,33.4l-7.6,33.5L408.1,489.3z M447.1,432.9l27.9-120.3\n          l41.7-0.1L447.1,432.9z"/>\n      </mask>\n      <g id=\'{{ID}}-gradient\' filter=\'url(#{{ID}}-blur)\'>\n        <g>\n          <path fill=\'#006EB6\' d="M0,0l300,300v-424.4C182.9-124.4,76.8-76.9,0,0z"/>\n          <path fill=\'#28348A\' d="M300-124.4V300L600,0C523.2-76.9,417.1-124.4,300-124.4z"/>\n          <path fill=\'#E20613\' d="M600,600c76.8-76.8,124.3-182.9,124.3-300H300L600,600z"/>\n          <path fill=\'#DA0078\' d="M300,300h424.4c0-117.1-47.5-223.2-124.3-300L300,300z"/>\n          <path fill=\'#5BC4F1\' d="M-124.4,300H300L0,0C-76.9,76.8-124.4,182.9-124.4,300z"/>\n          <path fill=\'#A1C517\' d="M0,600l300-300h-424.4C-124.4,417.1-76.9,523.2,0,600z"/>\n          <path fill=\'#F08800\' d="M300,724.4c117.1,0,223.2-47.5,300-124.3L300,300V724.4z"/>\n          <path fill=\'#FFCB00\' d="M300,724.4V300L0,600C76.8,676.9,182.9,724.4,300,724.4z"/>\n        </g>\n      </g>\n    </defs>\n  </svg>\n\n  <div class=\'__db_background\'></div>\n\n  <div class="__db_shape">\n    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 600 600" xmlns:xlink="http://www.w3.org/1999/xlink">\n      <use mask=\'url(#{{ID}}-shape-mask)\' xlink:href=\'#{{ID}}-gradient\'/>\n    </svg>\n  </div>\n\n  <div class="__db_score __db_score_{{SIZE}}">{{SCORE}}</div>\n  <div class="__db_label">{{LABEL}}</div>\n\n  <img src="{{BADGE_SERVER_URL}}/badge?count={{SCORE}}" class="__dimensions_png" alt="{{ALT_SCORE}}"/>\n</div>\n';
    },
    function (e, n) {
        e.exports =
            '<div class="__dimensions_Badge_Image">\n  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 440 90" xmlns:xlink="http://www.w3.org/1999/xlink">\n    <defs>\n      <filter id="{{ID}}-blur" color-interpolation-filters="sRGB">\n        <feGaussianBlur in="SourceGraphic" stdDeviation="20" />\n      </filter>\n\n      <filter filterUnits="objectBoundingBox" x=\'-1\' y=\'-1\' width=\'3\' height=\'3\' id="{{ID}}-glow" color-interpolation-filters="sRGB">\n        <feGaussianBlur in="SourceAlpha" stdDeviation="4"/> \n        <feColorMatrix type="matrix" values="-1  0  0  0  1 \n                                              0 -1  0  0  1 \n                                              0  0 -1  0  1\n                                              0  0  0  1  0"/>\n        <feMerge> \n          <feMergeNode/>\n          <feMergeNode in="SourceGraphic"/> \n        </feMerge>\n      </filter>\n    \n      <mask id=\'{{ID}}-shape-mask\'>\n        <path fill=\'white\' d="M89.8,83.9l14-50.5c0.6-2.1,0.1-4.4-1.4-6L67.7-11.7c-0.5-0.6-1.2-1.1-1.9-1.4\n          c-0.3-0.2-0.6-0.4-0.9-0.5c-0.4-0.1-0.9-0.2-1.3-0.1c-0.5,0-1.1,0-1.6,0.1L13.2-2.3c-2,0.5-3.6,2.1-4.2,4.1L-5,52.3\n          c-0.6,2.1,0,4.4,1.4,6l34.8,39.2c1.4,1.6,3.6,2.4,5.6,1.9l48.8-11.3C87.6,87.6,89.2,86,89.8,83.9 M39.7,77.1L25.6,16.6l0.1-0.1\n          l56.8,18.6L39.7,77.1z M32.9,73L2,53.8l19.3-30.5L32.9,73z M47.3,77.9l35.4-34.6l0.5,37.9L47.3,77.9z M32.1,12.5L63-6.6l16.1,34.4\n          L32.1,12.5z M24.1,10.4L17.8,3l29.4-6.8L24.1,10.4z M20,14.4L5.1,38l8.6-30.9L20,14.4z M35.6,81.6l-2.4,9.3L11.7,66.7L35.6,81.6z\n          M41.1,83.4l26.9,2.4l-29.3,6.8L41.1,83.4z M88.6,66.2L88.2,37l9.1-2.1L88.6,66.2z M96,29l-9,2.1l-12.2-26L96,29z"/>\n      </mask>\n\n      <g id=\'{{ID}}-gradient\' filter=\'url(#{{ID}}-blur)\'>\n        <g>\n          <path fill=\'#006EB6\' d="M-20.7-4l70.1,46.6L29.9-41.8C7.9-36.7-9.9-22.7-20.7-4z"/>\n          <path fill=\'#28348A\' d="M29.9-41.8l19.6,84.5l42.5-72.7C73.9-42.1,51.8-46.9,29.9-41.8z"/>\n          <path fill=\'#E20613\' d="M119.6,89.3c10.9-18.6,14.9-41.8,9.5-65.1L49.4,42.6L119.6,89.3z"/>\n          <path fill=\'#DA0078\' d="M49.4,42.6l79.7-18.5c-5.4-23.3-19.2-42.3-37.2-54.3L49.4,42.6z"/>\n          <path fill=\'#5BC4F1\' d="M-30.2,61.1l79.7-18.5L-20.7-4C-31.6,14.6-35.6,37.8-30.2,61.1z"/>\n          <path fill=\'#A1C517\' d="M6.9,115.4l42.5-72.7l-79.7,18.5C-24.8,84.4-11,103.4,6.9,115.4z"/>\n          <path fill=\'#F08800\' d="M69,127.1c22-5.1,39.7-19.2,50.6-37.8L49.4,42.6L69,127.1z"/>\n          <path fill=\'#FFCB00\' d="M69,127.1L49.4,42.6L6.9,115.4C24.9,127.3,47,132.2,69,127.1z"/>\n        </g>\n      </g>\n\n      <linearGradient id=\'{{ID}}-background-gradient\' gradientUnits="userSpaceOnUse" x1="158.5316" y1="30.6667" x2="158.5316" y2="120.6667">\n        <stop offset="0" style="stop-color:#FFFFFF"/>\n        <stop offset="1" style="stop-color:#C8C8C8"/>\n      </linearGradient>\n\n      <mask id=\'{{ID}}-background-mask\'>\n        <rect x="0" y="0" width="264" height="88" fill=\'#fff\'/>\n      </mask>\n    </defs>\n\n    <rect x="0" y="0" width="264" height="88" fill=\'#fff\'/>\n    <rect class=\'__db_background\' x="0" y="0" width="264" height="88" fill=\'url(#{{ID}}-background-gradient)\'/>\n\n    <g mask=\'url(#{{ID}}-background-mask)\'>\n      <use class=\'__db_shape\' mask=\'url(#{{ID}}-shape-mask)\' xlink:href=\'#{{ID}}-gradient\' opacity=\'0.75\'/>\n    </g>\n\n    <g filter=\'url(#{{ID}}-glow)\'>\n      <g filter=\'url(#{{ID}}-glow)\'>\n        <g filter=\'url(#{{ID}}-glow)\'>\n          <path d="M58.5,47.4c-0.3,3.7-1.7,6.6-4.1,8.7s-5.5,3.1-9.5,3.1c-2.8,0-5.2-0.7-7.3-2c-2.1-1.3-3.7-3.2-4.9-5.6 c-1.1-2.4-1.7-5.2-1.8-8.4V40c0-3.3,0.6-6.1,1.7-8.6c1.2-2.5,2.8-4.4,5-5.8s4.7-2,7.5-2c3.8,0,6.9,1,9.2,3.1c2.3,2.1,3.7,5,4.1,8.8 h-6c-0.3-2.5-1-4.3-2.2-5.4c-1.2-1.1-2.9-1.7-5.1-1.7c-2.6,0-4.6,1-6,2.9S37.1,36,37,39.7v3.1c0,3.7,0.7,6.6,2,8.6 c1.3,2,3.3,3,5.9,3c2.4,0,4.1-0.5,5.3-1.6c1.2-1.1,1.9-2.8,2.3-5.3H58.5z"/>\n          <path d="M63.4,26.2c0-0.9,0.3-1.6,0.8-2.2c0.6-0.6,1.4-0.9,2.4-0.9c1,0,1.9,0.3,2.4,0.9s0.9,1.3,0.9,2.2 c0,0.9-0.3,1.6-0.9,2.2c-0.6,0.6-1.4,0.9-2.4,0.9c-1,0-1.9-0.3-2.4-0.9C63.6,27.8,63.4,27.1,63.4,26.2z M69.5,58.7h-5.8V32.9h5.8 V58.7z"/>\n          <path d="M83,26.7v6.3h4.5v4.3H83v14.4c0,1,0.2,1.7,0.6,2.1s1.1,0.7,2.1,0.7c0.7,0,1.3-0.1,2-0.2v4.5 c-1.3,0.4-2.6,0.5-3.8,0.5c-4.4,0-6.7-2.5-6.7-7.4V37.2H73v-4.3h4.2v-6.3H83z"/>\n          <path d="M107.4,58.7c-0.3-0.5-0.5-1.3-0.7-2.4c-1.8,1.9-4.1,2.9-6.8,2.9c-2.6,0-4.7-0.7-6.3-2.2 c-1.6-1.5-2.5-3.3-2.5-5.5c0-2.7,1-4.9,3.1-6.3c2-1.5,5-2.2,8.7-2.2h3.5v-1.7c0-1.3-0.4-2.4-1.1-3.2c-0.7-0.8-1.9-1.2-3.4-1.2 c-1.3,0-2.4,0.3-3.2,1c-0.8,0.7-1.3,1.5-1.3,2.5h-5.8c0-1.4,0.5-2.7,1.4-4c0.9-1.2,2.2-2.2,3.8-2.9s3.4-1,5.4-1 c3,0,5.4,0.8,7.2,2.3s2.7,3.6,2.8,6.4v11.6c0,2.3,0.3,4.2,1,5.5v0.4H107.4z M101,54.5c1.1,0,2.2-0.3,3.2-0.8c1-0.6,1.8-1.3,2.3-2.2 v-4.9h-3.1c-2.1,0-3.8,0.4-4.8,1.1c-1.1,0.7-1.6,1.8-1.6,3.2c0,1.1,0.4,2,1.1,2.7S99.8,54.5,101,54.5z"/>\n          <path d="M125.6,26.7v6.3h4.5v4.3h-4.5v14.4c0,1,0.2,1.7,0.6,2.1s1.1,0.7,2.1,0.7c0.7,0,1.3-0.1,2-0.2v4.5 c-1.3,0.4-2.6,0.5-3.8,0.5c-4.4,0-6.7-2.5-6.7-7.4V37.2h-4.2v-4.3h4.2v-6.3H125.6z"/>\n          <path d="M134.6,26.2c0-0.9,0.3-1.6,0.8-2.2c0.6-0.6,1.4-0.9,2.4-0.9c1,0,1.9,0.3,2.4,0.9s0.9,1.3,0.9,2.2 c0,0.9-0.3,1.6-0.9,2.2c-0.6,0.6-1.4,0.9-2.4,0.9c-1,0-1.9-0.3-2.4-0.9C134.9,27.8,134.6,27.1,134.6,26.2z M140.7,58.7H135V32.9 h5.8V58.7z"/>\n          <path d="M146,45.6c0-2.5,0.5-4.8,1.5-6.8s2.4-3.6,4.2-4.7c1.8-1.1,3.9-1.6,6.2-1.6c3.5,0,6.3,1.1,8.5,3.4 c2.2,2.2,3.3,5.2,3.5,8.9l0,1.4c0,2.5-0.5,4.8-1.5,6.8c-1,2-2.4,3.5-4.2,4.6s-3.9,1.6-6.3,1.6c-3.6,0-6.5-1.2-8.7-3.6 s-3.3-5.6-3.3-9.7V45.6z M151.7,46.1c0,2.6,0.5,4.7,1.6,6.2c1.1,1.5,2.6,2.2,4.6,2.2s3.5-0.8,4.6-2.3c1.1-1.5,1.6-3.8,1.6-6.7 c0-2.6-0.6-4.7-1.7-6.2c-1.1-1.5-2.6-2.3-4.6-2.3c-1.9,0-3.4,0.7-4.5,2.2C152.3,40.8,151.7,43.1,151.7,46.1z"/>\n          <path d="M180.2,32.9l0.2,3c1.9-2.3,4.4-3.5,7.5-3.5c5.4,0,8.1,3.1,8.2,9.2v17h-5.8V42c0-1.6-0.4-2.8-1.1-3.6 c-0.7-0.8-1.9-1.2-3.5-1.2c-2.3,0-4.1,1.1-5.2,3.2v18.3h-5.8V32.9H180.2z"/>\n          <path d="M216.3,51.7c0-1-0.4-1.8-1.3-2.4c-0.8-0.5-2.3-1-4.2-1.4c-2-0.4-3.6-0.9-4.9-1.6c-2.9-1.4-4.3-3.4-4.3-6.1 c0-2.2,0.9-4.1,2.8-5.6c1.9-1.5,4.3-2.2,7.1-2.2c3.1,0,5.6,0.8,7.5,2.3c1.9,1.5,2.8,3.5,2.8,5.9H216c0-1.1-0.4-2-1.2-2.8 s-1.9-1.1-3.3-1.1c-1.3,0-2.3,0.3-3.1,0.9c-0.8,0.6-1.2,1.4-1.2,2.4c0,0.9,0.4,1.6,1.1,2.1c0.7,0.5,2.3,1,4.5,1.5 c2.3,0.5,4,1.1,5.3,1.8c1.3,0.7,2.3,1.5,2.9,2.5c0.6,1,0.9,2.1,0.9,3.5c0,2.3-1,4.2-2.9,5.6c-1.9,1.4-4.4,2.2-7.5,2.2 c-2.1,0-4-0.4-5.6-1.1c-1.7-0.8-2.9-1.8-3.9-3.1c-0.9-1.3-1.4-2.8-1.4-4.3h5.6c0.1,1.4,0.6,2.4,1.5,3.2c1,0.7,2.2,1.1,3.8,1.1 c1.5,0,2.7-0.3,3.5-0.9C215.9,53.4,216.3,52.6,216.3,51.7z"/>\n        </g>\n      </g>\n    </g>\n\n    <polygon fill=\'#fff\' points="286.8,87 286.8,56.3 272,41.9 286.8,26.6 286.8,0 438.8,0 438.8,87 "/>\n    <path fill=\'#969696\' d="M261,3v82H3V3H261 M264,0H0v88h264V0L264,0z"/>\n    <path fill=\'#969696\' d="M437,3v82H288V57.7v-1.3l-0.9-0.9L273.8,43l13.3-13.5l0.9-0.9v-1.2V3H437 M440,0H285v27.4 L269.5,43L285,57.7V88h155V0L440,0z"/>\n  </svg>\n\n  <div class="__db_score __db_score_{{SIZE}}">{{SCORE}}</div>\n  <img src="{{BADGE_SERVER_URL}}/badge?style=rectangle&count={{SCORE}}" class="__dimensions_png" alt="{{ALT_SCORE}}" />\n</div>\n';
    },
    function (e, n, t) {
        "use strict";
        t.d(n, "b", function () {
            return i;
        }),
            t.d(n, "a", function () {
                return s;
            });
        var i = function (e) {
                if ("string" == typeof e) return e;
                if ((e = e || 0) < 1e3) return "" + e;
                if (e < 1e4) {
                    return String(Math.round(e / 100) / 10) + "k";
                }
                return String(Math.round(e / 1e3)) + "k";
            },
            s = function (e) {
                var n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 10;
                return null == e || void 0 === e ? "n/a" : e < n ? String(Math.round(100 * e) / 100) : String(Math.floor(e));
            };
    },
    function (e, n, t) {
        "use strict";
        function i(e, n) {
            if (!(e instanceof n)) throw new TypeError("Cannot call a class as a function");
        }
        var s = t(7),
            r = (function () {
                function e(e, n) {
                    for (var t = 0; t < n.length; t++) {
                        var i = n[t];
                        (i.enumerable = i.enumerable || !1), (i.configurable = !0), "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i);
                    }
                }
                return function (n, t, i) {
                    return t && e(n.prototype, t), i && e(n, i), n;
                };
            })(),
            o = ["never", "always", "hover-auto", "hover-top", "hover-right", "hover-bottom", "hover-left"],
            a = ["small_circle", "medium_circle", "large_circle", "small_rectangle", "large_rectangle"],
            c = (function () {
                function e() {
                    var n = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [],
                        t = arguments[1],
                        s = arguments[2],
                        r = arguments[3];
                    i(this, e), (this.detailPageHost = t), (this.dimensionsMetricsApi = s), (this.badgeServerURL = r), (this.legendDisplay = "hover-auto"), (this.badgeType = "medium_circle");
                    for (var c = 0; c < n.length; c++) {
                        var d = n[c];
                        switch (d.name) {
                            case "data-doi":
                                this.doi = d.value;
                                break;
                            case "data-id":
                                this.id = d.value;
                                break;
                            case "data-pmid":
                                this.pmid = d.value;
                                break;
                            case "data-hide-zero-citations":
                                this.hideWhenZeroCitations = "false" !== d.value.toLowerCase();
                                break;
                            case "data-legend":
                                o.indexOf(d.value) >= 0 && (this.legendDisplay = d.value);
                                break;
                            case "data-style":
                                a.indexOf(d.value) >= 0 && (this.badgeType = d.value);
                        }
                    }
                }
                return (
                    r(e, [
                        {
                            key: "hasAnyIdentifiers",
                            get: function () {
                                return this.doi || this.id || this.pmid;
                            },
                        },
                        {
                            key: "preferredIdentifier",
                            get: function () {
                                return this.id ? new s.b(this.id) : this.doi ? new s.a(this.doi) : this.pmid ? new s.c(this.pmid) : void 0;
                            },
                        },
                        {
                            key: "metricsURL",
                            get: function () {
                                var e = this.preferredIdentifier;
                                return this.dimensionsMetricsApi + "/" + e.type + "/" + e.value;
                            },
                        },
                        {
                            key: "detailPageURL",
                            get: function () {
                                var e = this.preferredIdentifier,
                                    n = this.detailPageHost + "/details/" + e.type + "/" + e.value;
                                return window.location.host && (n += "?domain=" + window.location.protocol + "//" + window.location.host), n;
                            },
                        },
                    ]),
                    e
                );
            })();
        n.a = c;
    },
    function (e, n, t) {
        "use strict";
        function i(e, n) {
            if (!e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
            return !n || ("object" != typeof n && "function" != typeof n) ? e : n;
        }
        function s(e, n) {
            if ("function" != typeof n && null !== n) throw new TypeError("Super expression must either be null or a function, not " + typeof n);
            (e.prototype = Object.create(n && n.prototype, { constructor: { value: e, enumerable: !1, writable: !0, configurable: !0 } })), n && (Object.setPrototypeOf ? Object.setPrototypeOf(e, n) : (e.__proto__ = n));
        }
        function r(e, n) {
            if (!(e instanceof n)) throw new TypeError("Cannot call a class as a function");
        }
        t.d(n, "a", function () {
            return a;
        }),
            t.d(n, "b", function () {
                return c;
            }),
            t.d(n, "c", function () {
                return d;
            });
        var o = function e(n) {
                r(this, e), (this.value = n);
            },
            a = (function (e) {
                function n() {
                    var e, t, s, o;
                    r(this, n);
                    for (var a = arguments.length, c = Array(a), d = 0; d < a; d++) c[d] = arguments[d];
                    return (t = s = i(this, (e = n.__proto__ || Object.getPrototypeOf(n)).call.apply(e, [this].concat(c)))), Object.defineProperty(s, "type", { enumerable: !0, writable: !0, value: "doi" }), (o = t), i(s, o);
                }
                return s(n, e), n;
            })(o),
            c = (function (e) {
                function n() {
                    var e, t, s, o;
                    r(this, n);
                    for (var a = arguments.length, c = Array(a), d = 0; d < a; d++) c[d] = arguments[d];
                    return (t = s = i(this, (e = n.__proto__ || Object.getPrototypeOf(n)).call.apply(e, [this].concat(c)))), Object.defineProperty(s, "type", { enumerable: !0, writable: !0, value: "id" }), (o = t), i(s, o);
                }
                return s(n, e), n;
            })(o),
            d = (function (e) {
                function n() {
                    var e, t, s, o;
                    r(this, n);
                    for (var a = arguments.length, c = Array(a), d = 0; d < a; d++) c[d] = arguments[d];
                    return (t = s = i(this, (e = n.__proto__ || Object.getPrototypeOf(n)).call.apply(e, [this].concat(c)))), Object.defineProperty(s, "type", { enumerable: !0, writable: !0, value: "pmid" }), (o = t), i(s, o);
                }
                return s(n, e), n;
            })(o);
    },
    function (e, n, t) {
        "use strict";
        function i(e, n) {
            if (!(e instanceof n)) throw new TypeError("Cannot call a class as a function");
        }
        var s = t(9),
            r = t.n(s),
            o = (function () {
                function e(e, n) {
                    for (var t = 0; t < n.length; t++) {
                        var i = n[t];
                        (i.enumerable = i.enumerable || !1), (i.configurable = !0), "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i);
                    }
                }
                return function (n, t, i) {
                    return t && e(n.prototype, t), i && e(n, i), n;
                };
            })(),
            a = (function () {
                function e(n) {
                    i(this, e),
                        (this.url = n),
                        (this.exists = void 0),
                        (this.timesCited = null),
                        (this.recentCitations = null),
                        (this.highlyCited1 = null),
                        (this.highlyCited5 = null),
                        (this.highlyCited10 = null),
                        (this.rcr = null),
                        (this.fcr = null);
                }
                return (
                    o(e, [
                        {
                            key: "fetch",
                            value: function (e) {
                                var n = this;
                                r.a.get(this.url, { useXDR: !0 }, function (t, i, s) {
                                    if (i.statusCode < 200 || i.statusCode >= 300) n.exists = !1;
                                    else {
                                        var r = JSON.parse(s);
                                        (n.exists = !0),
                                            (n.timesCited = r.times_cited),
                                            (n.recentCitations = r.recent_citations),
                                            (n.highlyCited1 = r.highly_cited_1),
                                            (n.highlyCited5 = r.highly_cited_5),
                                            (n.highlyCited10 = r.highly_cited_10),
                                            (n.rcr = r.relative_citation_ratio),
                                            (n.fcr = r.field_citation_ratio);
                                    }
                                    e(n);
                                });
                            },
                        },
                    ]),
                    e
                );
            })();
        n.a = a;
    },
    function (e, n, t) {
        "use strict";
        function i(e) {
            for (var n in e) if (e.hasOwnProperty(n)) return !1;
            return !0;
        }
        function s(e, n, t) {
            var i = e;
            return l(n) ? ((t = n), "string" == typeof e && (i = { uri: e })) : (i = _(n, { uri: e })), (i.callback = t), i;
        }
        function r(e, n, t) {
            return (n = s(e, n, t)), o(n);
        }
        function o(e) {
            function n() {
                4 === l.readyState && setTimeout(o, 0);
            }
            function t() {
                var e = void 0;
                if (((e = l.response ? l.response : l.responseText || a(l)), y))
                    try {
                        e = JSON.parse(e);
                    } catch (e) {}
                return e;
            }
            function s(e) {
                return clearTimeout(f), e instanceof Error || (e = new Error("" + (e || "Unknown XMLHttpRequest Error"))), (e.statusCode = 0), d(e, w);
            }
            function o() {
                if (!h) {
                    var n;
                    clearTimeout(f), (n = e.useXDR && void 0 === l.status ? 200 : 1223 === l.status ? 204 : l.status);
                    var i = w,
                        s = null;
                    return (
                        0 !== n ? ((i = { body: t(), statusCode: n, method: g, headers: {}, url: p, rawRequest: l }), l.getAllResponseHeaders && (i.headers = u(l.getAllResponseHeaders()))) : (s = new Error("Internal XMLHttpRequest Error")),
                        d(s, i, i.body)
                    );
                }
            }
            if (void 0 === e.callback) throw new Error("callback argument missing");
            var c = !1,
                d = function (n, t, i) {
                    c || ((c = !0), e.callback(n, t, i));
                },
                l = e.xhr || null;
            l || (l = e.cors || e.useXDR ? new r.XDomainRequest() : new r.XMLHttpRequest());
            var _,
                h,
                f,
                p = (l.url = e.uri || e.url),
                g = (l.method = e.method || "GET"),
                m = e.body || e.data,
                v = (l.headers = e.headers || {}),
                b = !!e.sync,
                y = !1,
                w = { body: void 0, headers: {}, statusCode: 0, method: g, url: p, rawRequest: l };
            if (
                ("json" in e &&
                    !1 !== e.json &&
                    ((y = !0),
                    v.accept || v.Accept || (v.Accept = "application/json"),
                    "GET" !== g && "HEAD" !== g && (v["content-type"] || v["Content-Type"] || (v["Content-Type"] = "application/json"), (m = JSON.stringify(!0 === e.json ? m : e.json)))),
                (l.onreadystatechange = n),
                (l.onload = o),
                (l.onerror = s),
                (l.onprogress = function () {}),
                (l.onabort = function () {
                    h = !0;
                }),
                (l.ontimeout = s),
                l.open(g, p, !b, e.username, e.password),
                b || (l.withCredentials = !!e.withCredentials),
                !b &&
                    e.timeout > 0 &&
                    (f = setTimeout(function () {
                        if (!h) {
                            (h = !0), l.abort("timeout");
                            var e = new Error("XMLHttpRequest timeout");
                            (e.code = "ETIMEDOUT"), s(e);
                        }
                    }, e.timeout)),
                l.setRequestHeader)
            )
                for (_ in v) v.hasOwnProperty(_) && l.setRequestHeader(_, v[_]);
            else if (e.headers && !i(e.headers)) throw new Error("Headers cannot be set on an XDomainRequest object");
            return "responseType" in e && (l.responseType = e.responseType), "beforeSend" in e && "function" == typeof e.beforeSend && e.beforeSend(l), l.send(m || null), l;
        }
        function a(e) {
            try {
                if ("document" === e.responseType) return e.responseXML;
                var n = e.responseXML && "parsererror" === e.responseXML.documentElement.nodeName;
                if ("" === e.responseType && !n) return e.responseXML;
            } catch (e) {}
            return null;
        }
        function c() {}
        var d = t(10),
            l = t(12),
            u = t(13),
            _ = t(14);
        (e.exports = r),
            (e.exports.default = r),
            (r.XMLHttpRequest = d.XMLHttpRequest || c),
            (r.XDomainRequest = "withCredentials" in new r.XMLHttpRequest() ? r.XMLHttpRequest : d.XDomainRequest),
            (function (e, n) {
                for (var t = 0; t < e.length; t++) n(e[t]);
            })(["get", "put", "post", "patch", "head", "delete"], function (e) {
                r["delete" === e ? "del" : e] = function (n, t, i) {
                    return (t = s(n, t, i)), (t.method = e.toUpperCase()), o(t);
                };
            });
    },
    function (e, n, t) {
        (function (n) {
            var t;
            (t = "undefined" != typeof window ? window : void 0 !== n ? n : "undefined" != typeof self ? self : {}), (e.exports = t);
        }.call(n, t(11)));
    },
    function (e, n) {
        var t;
        t = (function () {
            return this;
        })();
        try {
            t = t || Function("return this")() || (0, eval)("this");
        } catch (e) {
            "object" == typeof window && (t = window);
        }
        e.exports = t;
    },
    function (e, n) {
        function t(e) {
            var n = i.call(e);
            return "[object Function]" === n || ("function" == typeof e && "[object RegExp]" !== n) || ("undefined" != typeof window && (e === window.setTimeout || e === window.alert || e === window.confirm || e === window.prompt));
        }
        e.exports = t;
        var i = Object.prototype.toString;
    },
    function (e, n) {
        var t = function (e) {
                return e.replace(/^\s+|\s+$/g, "");
            },
            i = function (e) {
                return "[object Array]" === Object.prototype.toString.call(e);
            };
        e.exports = function (e) {
            if (!e) return {};
            for (var n = {}, s = t(e).split("\n"), r = 0; r < s.length; r++) {
                var o = s[r],
                    a = o.indexOf(":"),
                    c = t(o.slice(0, a)).toLowerCase(),
                    d = t(o.slice(a + 1));
                void 0 === n[c] ? (n[c] = d) : i(n[c]) ? n[c].push(d) : (n[c] = [n[c], d]);
            }
            return n;
        };
    },
    function (e, n) {
        function t() {
            for (var e = {}, n = 0; n < arguments.length; n++) {
                var t = arguments[n];
                for (var s in t) i.call(t, s) && (e[s] = t[s]);
            }
            return e;
        }
        e.exports = t;
        var i = Object.prototype.hasOwnProperty;
    },
]);
