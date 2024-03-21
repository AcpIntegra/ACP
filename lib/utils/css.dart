String? interpolationBackgroundColor(bool isDark) {
  return isDark ? 'background-color: black;' : 'background-color: white;';
}

String interpolationTextColor(bool isDark) {
  return isDark ? '#fff' : '#333';
}

// String interpolationTableHeader(bool isDark) {
//   return isDark ? '#313131' : 'rgba(0, 126, 102, 0.2)';
// }

String interpolationHTag(bool isDark) {
  return isDark ? 'white' : '#005879';
}

String interpolationLinkFullText(bool isDark) {
  return isDark ? '#fff' : '#005879';
}

String interpolationSwipeLinkText(bool isDark) {
  return isDark ? 'white' : 'black';
}

String interpolationSubtitle(bool isDark) {
  return isDark ? 'white' : 'black';
}

String cssFunction(bool isDark) {
  return '''
html,
body {
  ${interpolationBackgroundColor(isDark)}
	position: relative;
	width: 100%;
	height: 100%
}

.x-fullscreen {
	position: absolute !important
}

.x-body {
	position: relative;
	z-index: 0
}


.x-inner,
.x-body {
	width: 100%;
	height: 100%
}

.x-sized {
	position: relative
}

.x-innerhtml {
	width: 100%
}

.x-layout-box {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox
}

.x-layout-box.x-horizontal {
	-webkit-box-orient: horizontal !important;
	-ms-flex-direction: row !important;
	flex-direction: row !important
}

.x-layout-box.x-horizontal>.x-layout-box-item.x-flexed {
	min-width: 0 !important
}

.x-layout-box.x-vertical {
	-webkit-box-orient: vertical !important;
	-ms-flex-direction: column !important;
	flex-direction: column !important
}

.x-layout-box.x-vertical>.x-layout-box-item.x-flexed {
	min-height: 0 !important
}

.x-layout-box>.x-layout-box-item {
	display: flex !important;
	display: -webkit-box !important;
	display: -ms-flexbox !important
}

.x-layout-box.x-align-start {
	-webkit-box-align: start;
	-ms-flex-align: start;
	align-items: flex-start
}

.x-layout-box.x-align-center {
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center
}

.x-layout-box.x-align-end {
	-webkit-box-align: end;
	-ms-flex-align: end;
	align-items: flex-end
}

.x-layout-box.x-align-stretch {
	-webkit-box-align: stretch;
	-ms-flex-align: stretch;
	align-items: stretch
}

.x-layout-box.x-pack-start {
	-webkit-box-pack: start;
	-ms-flex-pack: start;
	justify-content: flex-start
}

.x-layout-box.x-pack-center {
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center
}

.x-layout-box.x-pack-end {
	-webkit-box-pack: end;
	-ms-flex-pack: end;
	justify-content: flex-end
}

.x-layout-box.x-pack-justify {
	-webkit-box-pack: justify;
	-ms-flex-pack: justify;
	justify-content: space-between
}

.x-layout-box-item.x-sized>.x-inner,
.x-layout-box-item.x-sized>.x-body,
.x-layout-box-item.x-sized>.x-dock-outer {
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.x-webkit .x-layout-box.x-horizontal>.x-layout-box-item.x-flexed {
	width: 0 !important
}

.x-webkit .x-layout-box.x-vertical>.x-layout-box-item.x-flexed {
	height: 0 !important
}

.x-firefox .x-stretched.x-dock-horizontal>.x-dock-body {
	width: 0
}

.x-firefox .x-stretched.x-dock-vertical>.x-dock-body {
	height: 0
}

.x-firefox .x-container .x-dock-horizontal.x-unsized .x-dock-body {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 0px;
	flex: 1 0 0px;
	min-height: 0;
	min-width: 0
}

.x-firefox .x-has-height>.x-dock.x-unsized.x-dock-vertical>.x-dock-body {
	height: 0
}

.x-layout-card {
	position: relative;
	overflow: hidden
}

.x-layout-card-perspective {
	-webkit-perspective: 1000px;
	-ms-perspective: 1000px;
	perspective: 1000px
}

.x-layout-card-item-container {
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.x-layout-card-item {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	position: absolute !important
}

.x-dock {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox
}

.x-dock>.x-dock-body {
	overflow: hidden
}

.x-dock.x-sized,
.x-dock.x-sized>.x-dock-body>*,
.x-dock.x-sized>.x-dock-body>.x-body>.x-inner {
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.x-dock.x-sized>.x-dock-body {
	position: relative;
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto;
	min-height: 0;
	min-width: 0
}

.x-dock.x-unsized,
.x-dock.x-stretched {
	height: 100%
}

.x-dock.x-unsized>.x-dock-body,
.x-dock.x-stretched>.x-dock-body {
	position: relative;
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto;
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column;
	min-height: 0;
	min-width: 0
}

.x-dock.x-unsized>.x-dock-body>*,
.x-dock.x-stretched>.x-dock-body>* {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto;
	min-height: 0;
	min-width: 0
}

.x-dock.x-dock-vertical {
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column
}

.x-dock.x-dock-horizontal {
	-webkit-box-orient: horizontal !important;
	-ms-flex-direction: row !important;
	flex-direction: row !important
}

.x-dock.x-dock-horizontal>.x-dock-item {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox
}

.x-dock.x-dock-horizontal>.x-dock-item.x-sized>.x-inner,
.x-dock.x-dock-horizontal>.x-dock-item.x-sized>.x-body {
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.x-dock.x-dock-horizontal>.x-dock-item.x-unsized {
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column
}

.x-dock.x-dock-horizontal>.x-dock-item.x-unsized>* {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto;
	min-height: 0;
	min-width: 0
}

.x-ie .x-stretched.x-dock-horizontal>.x-dock-body {
	width: 0
}

.x-ie .x-stretched.x-dock-vertical>.x-dock-body {
	height: 0
}

.x-ie .x-has-width>.x-dock.x-unsized.x-dock-horizontal>.x-dock-body {
	width: 0
}

.x-ie .x-has-height>.x-dock.x-unsized.x-dock-vertical>.x-dock-body {
	height: 0
}

.x-stretched.x-container {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column
}

.x-stretched.x-container>.x-inner,
.x-stretched.x-container>.x-body,
.x-stretched.x-container>.x-body>.x-inner {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto;
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column;
	min-height: 0px
}

.x-layout-fit.x-stretched>.x-layout-fit-item {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto;
	min-height: 0;
	min-width: 0
}

.x-layout-fit {
	position: relative
}

.x-layout-fit-item.x-sized {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.x-layout-fit-item.x-unsized {
	width: 100%;
	height: 100%
}

.x-ie .x-stretched>.x-inner,
.x-ie .x-stretched>.x-body {
	min-height: inherit
}

.x-center,
.x-centered {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center
}

.x-center>*,
.x-centered>* {
	position: relative
}

.x-center>.x-floating,
.x-centered>.x-floating {
	position: relative !important
}

.x-floating {
	position: absolute !important
}

.x-layout-float {
	overflow: hidden
}

.x-layout-float>.x-layout-float-item {
	float: left
}

.x-layout-float.x-direction-right>.x-layout-float-item {
	float: right
}

@-webkit-keyframes x-paint-monitor-helper {
	from {
		zoom: 1
	}

	to {
		zoom: 1
	}
}

@keyframes x-paint-monitor-helper {
	from {
		zoom: 1
	}

	to {
		zoom: 1
	}
}

.x-paint-monitored {
	position: relative
}

.x-paint-monitor {
	width: 0 !important;
	height: 0 !important;
	visibility: hidden
}

.x-paint-monitor.cssanimation {
	-webkit-animation-duration: 0.0001ms;
	-webkit-animation-name: x-paint-monitor-helper;
	animation-duration: 0.0001ms;
	animation-name: x-paint-monitor-helper
}

.x-paint-monitor.overflowchange {
	overflow: hidden
}

.x-paint-monitor.overflowchange::after {
	content: '';
	display: block;
	width: 1px !important;
	height: 1px !important
}

.x-size-monitored {
	position: relative
}

.x-size-monitors {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	visibility: hidden;
	overflow: hidden
}

.x-size-monitors>* {
	width: 100%;
	height: 100%;
	overflow: hidden
}

.x-size-monitors.scroll>*.shrink::after {
	content: '';
	display: block;
	width: 200%;
	height: 200%;
	min-width: 1px;
	min-height: 1px
}

.x-size-monitors.scroll>*.expand::after {
	content: '';
	display: block;
	width: 100000px;
	height: 100000px
}

.x-size-monitors.overflowchanged>*.shrink>* {
	width: 100%;
	height: 100%
}

.x-size-monitors.overflowchanged>*.expand>* {
	width: 200%;
	height: 200%
}

.x-size-change-detector {
	visibility: hidden;
	position: absolute;
	left: 0;
	top: 0;
	z-index: -1;
	width: 100%;
	height: 100%;
	overflow: hidden
}

.x-size-change-detector>* {
	visibility: hidden
}

.x-size-change-detector-shrink>* {
	width: 200%;
	height: 200%
}

.x-size-change-detector-expand>* {
	width: 100000px;
	height: 100000px
}

.x-translatable {
	position: absolute !important;
	top: 500000px !important;
	left: 500000px !important;
	overflow: visible !important;
	z-index: 1
}

.x-translatable-hboxfix {
	position: absolute;
	min-width: 100%;
	top: 0;
	left: 0
}

.x-translatable-hboxfix>.x-translatable {
	position: relative !important
}

.x-translatable-container {
	overflow: hidden;
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.x-translatable-container::before {
	content: '';
	display: block;
	width: 1000000px;
	height: 1000000px;
	visibility: hidden
}

.x-button {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	background-color: #eee;
	border: 1px solid #ccc;
	position: relative;
	overflow: hidden;
	z-index: 1
}

.x-button .x-button-icon {
	position: relative;
	background-repeat: no-repeat;
	background-position: center
}

.x-button .x-button-icon.x-shown {
	display: block
}

.x-button .x-button-icon.x-hidden {
	display: none
}

.x-iconalign-left,
.x-icon-align-right {
	-webkit-box-orient: horizontal;
	-ms-flex-direction: row;
	flex-direction: row
}

.x-iconalign-top,
.x-iconalign-bottom {
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column
}

.x-iconalign-bottom,
.x-iconalign-right {
	-webkit-box-direction: reverse;
	-ms-flex-direction: row-reverse;
	flex-direction: row-reverse
}

.x-iconalign-center {
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center
}

.x-button-label,
.x-badge,
.x-hasbadge .x-badge {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	white-space: nowrap;
	text-overflow: ellipsis;
	text-align: center;
	display: block;
	overflow: hidden
}

.x-badge {
	background-color: #ccc;
	border: 1px solid #aaa;
	z-index: 2;
	position: absolute !important;
	width: auto;
	font-size: .6em;
	right: 0;
	top: 0;
	max-width: 95%;
	display: inline-block
}

html,
body {
	font-family: "Helvetica Neue", HelveticaNeue, "Helvetica-Neue", Helvetica, "BBAlpha Sans", sans-serif;
	font-weight: normal;
	-webkit-text-size-adjust: none;
	margin: 0;
	cursor: default
}

body,
div,
dl,
dt,
dd,
ul,
ol,
li,
h1,
h2,
h3,
h4,
h5,
h6,
pre,
code,
form,
fieldset,
legend,
input,
textarea,
p,
blockquote,
th,
td {
	margin: 0;
	padding: 0
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

fieldset,
img {
	border: 0
}

address,
caption,
cite,
code,
dfn,
em,
strong,
th,
var {
	font-style: normal;
	font-weight: normal
}

li {
	list-style: none
}

caption,
th {
	text-align: left
}

h1,
h2,
h3,
h4,
h5,
h6 {
	font-size: 100%;
	font-weight: normal
}

q:before,
q:after {
	content: ''
}

abbr,
acronym {
	border: 0;
	font-variant: normal
}

sup {
	vertical-align: text-top
}

sub {
	vertical-align: text-bottom
}

input,
textarea,
select {
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit
}

*:focus {
	outline: none
}

body.x-desktop {
	overflow: hidden
}

@-ms-viewport {
	width: device-width
}

*,
*:after,
*:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	-webkit-touch-callout: none;
	-webkit-user-drag: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	-ms-touch-action: none;
	-moz-user-select: -moz-none
}

input,
textarea {
	-webkit-user-select: text;
	-ms-user-select: auto;
	-moz-user-select: text
}

.x-hidden-visibility {
	visibility: hidden !important
}

.x-hidden-display,
.x-field-hidden {
	display: none !important
}

.x-hidden-offsets {
	position: absolute !important;
	left: -10000em;
	top: -10000em;
	visibility: hidden
}

.x-html {
	-webkit-user-select: auto;
	-webkit-touch-callout: inherit;
	-ms-user-select: auto;
	line-height: 1.5;
	color: #333;
	font-size: .8em;
	padding: 1.2em
}

.x-html body {
	line-height: 1.5;
	font-family: "Helvetica Neue", Arial, Helvetica, sans-serif;
	color: ${interpolationTextColor(isDark)};
	font-size: 75%
}

.x-html h1,
.x-html h2,
.x-html h3,
.x-html h4,
.x-html h5,
.x-html h6 {
	font-weight: normal;
	color: #222
}

.x-html h1 img,
.x-html h2 img,
.x-html h3 img,
.x-html h4 img,
.x-html h5 img,
.x-html h6 img {
	margin: 0
}

.x-html h1 {
	font-size: 3em;
	line-height: 1;
	margin-bottom: 0.50em
}

.x-html h2 {
	font-size: 2em;
	margin-bottom: 0.75em
}

.x-html h3 {
	font-size: 1.5em;
	line-height: 1;
	margin-bottom: 1.00em
}

.x-html h4 {
	font-size: 1.2em;
	line-height: 1.25;
	margin-bottom: 1.25em
}

.x-html h5 {
	font-size: 1em;
	font-weight: bold;
	margin-bottom: 1.50em
}

.x-html h6 {
	font-size: 1em;
	font-weight: bold
}

.x-html p {
	margin: 0 0 1.5em
}

.x-html p .left {
	display: inline;
	float: left;
	margin: 1.5em 1.5em 1.5em 0;
	padding: 0
}

.x-html p .right {
	display: inline;
	float: right;
	margin: 1.5em 0 1.5em 1.5em;
	padding: 0
}

.x-html a {
	text-decoration: underline;
	color: #06c
}

.x-html a:visited {
	color: #004c99
}

.x-html a:focus {
	color: #09f
}

.x-html a:hover {
	color: #09f
}

.x-html a:active {
	color: #bf00ff
}

.x-html blockquote {
	margin: 1.5em;
	color: #666;
	font-style: italic
}

.x-html strong,
.x-html dfn {
	font-weight: bold
}

.x-html em,
.x-html dfn {
	font-style: italic
}

.x-html sup,
.x-html sub {
	line-height: 0
}

.x-html abbr,
.x-html acronym {
	border-bottom: 1px dotted #666666
}

.x-html address {
	margin: 0 0 1.5em;
	font-style: italic
}

.x-html del {
	color: #666
}

.x-html pre {
	margin: 1.5em 0;
	white-space: pre
}

.x-html pre,
.x-html code,
.x-html tt {
	font: 1em "andale mono", "lucida console", monospace;
	line-height: 1.5
}

.x-html li ul,
.x-html li ol {
	margin: 0
}

.x-html ul,
.x-html ol {
	margin: 0 1.5em 1.5em 0;
	padding-left: 1.5em
}

.x-html ul {
	list-style-type: disc
}

.x-html ol {
	list-style-type: decimal
}

.x-html dl {
	margin: 0 0 1.5em 0
}

.x-html dl dt {
	font-weight: bold
}

.x-html dd {
	margin-left: 1.5em
}

.x-html table {
	margin-bottom: 1.4em;
	width: 100%
}

.x-html th {
	font-weight: bold
}

.x-html thead th {
	background: #c3d9ff
}

.x-html th,
.x-html td,
.x-html caption {
	padding: 4px 10px 4px 5px
}

.x-html table.striped tr:nth-child(even) td,
.x-html table tr.even td {
	background: #e5ecf9
}

.x-html tfoot {
	font-style: italic
}

.x-html caption {
	background: #eee
}

.x-html .quiet {
	color: #666
}

.x-html .loud {
	color: #111
}

.x-html ul li {
	list-style-type: circle
}

.x-html ol li {
	list-style-type: decimal
}

@-webkit-keyframes x-loading-spinner-rotate {
	0% {
		-webkit-transform: rotate(0deg)
	}

	8.32% {
		-webkit-transform: rotate(0deg)
	}

	8.33% {
		-webkit-transform: rotate(30deg)
	}

	16.65% {
		-webkit-transform: rotate(30deg)
	}

	16.66% {
		-webkit-transform: rotate(60deg)
	}

	24.99% {
		-webkit-transform: rotate(60deg)
	}

	25% {
		-webkit-transform: rotate(90deg)
	}

	33.32% {
		-webkit-transform: rotate(90deg)
	}

	33.33% {
		-webkit-transform: rotate(120deg)
	}

	41.65% {
		-webkit-transform: rotate(120deg)
	}

	41.66% {
		-webkit-transform: rotate(150deg)
	}

	49.99% {
		-webkit-transform: rotate(150deg)
	}

	50% {
		-webkit-transform: rotate(180deg)
	}

	58.32% {
		-webkit-transform: rotate(180deg)
	}

	58.33% {
		-webkit-transform: rotate(210deg)
	}

	66.65% {
		-webkit-transform: rotate(210deg)
	}

	66.66% {
		-webkit-transform: rotate(240deg)
	}

	74.99% {
		-webkit-transform: rotate(240deg)
	}

	75% {
		-webkit-transform: rotate(270deg)
	}

	83.32% {
		-webkit-transform: rotate(270deg)
	}

	83.33% {
		-webkit-transform: rotate(300deg)
	}

	91.65% {
		-webkit-transform: rotate(300deg)
	}

	91.66% {
		-webkit-transform: rotate(330deg)
	}

	100% {
		-webkit-transform: rotate(330deg)
	}
}

@keyframes x-loading-spinner-rotate {
	0% {
		-ms-transform: rotate(0deg);
		transform: rotate(0deg)
	}

	8.32% {
		-ms-transform: rotate(0deg);
		transform: rotate(0deg)
	}

	8.33% {
		-ms-transform: rotate(30deg);
		transform: rotate(30deg)
	}

	16.65% {
		-ms-transform: rotate(30deg);
		transform: rotate(30deg)
	}

	16.66% {
		-ms-transform: rotate(60deg);
		transform: rotate(60deg)
	}

	24.99% {
		-ms-transform: rotate(60deg);
		transform: rotate(60deg)
	}

	25% {
		-ms-transform: rotate(90deg);
		transform: rotate(90deg)
	}

	33.32% {
		-ms-transform: rotate(90deg);
		transform: rotate(90deg)
	}

	33.33% {
		-ms-transform: rotate(120deg);
		transform: rotate(120deg)
	}

	41.65% {
		-ms-transform: rotate(120deg);
		transform: rotate(120deg)
	}

	41.66% {
		-ms-transform: rotate(150deg);
		transform: rotate(150deg)
	}

	49.99% {
		-ms-transform: rotate(150deg);
		transform: rotate(150deg)
	}

	50% {
		-ms-transform: rotate(180deg);
		transform: rotate(180deg)
	}

	58.32% {
		-ms-transform: rotate(180deg);
		transform: rotate(180deg)
	}

	58.33% {
		-ms-transform: rotate(210deg);
		transform: rotate(210deg)
	}

	66.65% {
		-ms-transform: rotate(210deg);
		transform: rotate(210deg)
	}

	66.66% {
		-ms-transform: rotate(240deg);
		transform: rotate(240deg)
	}

	74.99% {
		-ms-transform: rotate(240deg);
		transform: rotate(240deg)
	}

	75% {
		-ms-transform: rotate(270deg);
		transform: rotate(270deg)
	}

	83.32% {
		-ms-transform: rotate(270deg);
		transform: rotate(270deg)
	}

	83.33% {
		-ms-transform: rotate(300deg);
		transform: rotate(300deg)
	}

	91.65% {
		-ms-transform: rotate(300deg);
		transform: rotate(300deg)
	}

	91.66% {
		-ms-transform: rotate(330deg);
		transform: rotate(330deg)
	}

	100% {
		-ms-transform: rotate(330deg);
		transform: rotate(330deg)
	}
}

@font-face {
	font-family: "Pictos";
	src: url('data:application/x-font-woff;base64,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') format('woff'), url('data:font/truetype;base64,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AQIFAw4BAQQCCAEBBAIBAQMDAgYGAgECAgEBAQICAQ0DAQICBQEMBwIFAgICBgMCBQQCBAQMAQMBAQEBBAUBAwkBAwEBAgEDAgIBBAICBgECBgMCBQIGCAUFAQUIAQMFAQELAQEGAQIDAQEBBAEBAQMCBgIEAwQGAgQHAgMDAQIGAQIBAQICAQQBBQECGwQCAQUDAQIDAgcFCAMBBgMEAwQEBAMDAQIDAwUCAgEIBgIKAQ0EBAIGAwQMAwELAQcJCAIDAgYDAQcBBwYDBAYCAgUBAwEBCwcIAgEKIceMUo4vBwIDBQUBBAIKAgEBAQMBAQMCBQIDAgJFAhkBAgEBBwQHAgoBAQUCAwMDAQIJAQUClAEFBQsCCAEDBAcBBAUBAwMBAScCBgEDAwIEAQIBBQEHAgMCAgMMBAMBAQIHARYCAgMEBQQCAgEBBAEBAwYBAwOgAQPKAgMBAQMCAQUCAQEWAgcCBQFxBgoGBQEDAgICCQEJAQ4EAgEBAQQCAgECBAECAQEBAQ8HARMPAgECAQUEAQMFAQIBAQQBBAQGBgMDCwENCgoBBwoDCQQIBAQDAwQEAgECAQIDAgEDAwQCBAEEAQIEAQMDAwUJAQgNAQMICAoQBgIICQYBAgICAQUCBQYGAQUBAgoDAQH+YwMEAgEBEQQHAgMBAggEBQUGIwICAQENAQcBBwIBCAIfBAUGAgEBJgMEAgIBARABAQF9AgICuvb+pPb2AVwzAwMFAggECwIBBAIECQIBAgECBgECAgIEBwECAQMEAgX+wFprEwkCCQIBAwgEBAMHAgQBBAEHAQMDBQoEAQMEAQIBAQIIAgEEAgYCAgMFAQcEDAUMDgIKAQsECQQBAgkBCQICAQEBAQIDAgwDAQQDBAcBAQEKAQQKAQIBBwQCBgkBBQEFAQECAwYDDAMEAgcBAgIBAQESAgMEAwEBAQQJAQgKAQICAQQDBgIEBgYBBAYFAQIBAgECAQIGBAgBAwMCAgEDAQsDAgYCAwoCAgcEAQIGBQ0IBAMCAgIBAQIIBAICCQIEAgECBQQCAQM4QFsBAwEGAgcCBgIBAQICBAEBAQIBAQECAQICAQIDBAMCBAMKBwEKAQoDAQICCwICAQQCBQEBAQEBCwIHBAECAQEBAQIPCAQBAgMEBgoCAQUDAQICAgYGAgQFAgEJAwECAQ0DAQMCBgQBCQMC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') format('truetype'), url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiID4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgo8bWV0YWRhdGE+ClRoaXMgaXMgYSBjdXN0b20gU1ZHIHdlYmZvbnQgZ2VuZXJhdGVkIGJ5IEZvbnQgU3F1aXJyZWwuCkRlc2lnbmVyICAgIDogRHJldyBXaWxzb24KRm91bmRyeSAgICAgOiBEcmV3IFdpbHNvbgpGb3VuZHJ5IFVSTCA6IGh0dHBwaWN0b3NkcmV3d2lsc29uY29tCjwvbWV0YWRhdGE+CjxkZWZzPgo8Zm9udCBpZD0id2ViZm9udEl5Zlpic2VGIiBob3Jpei1hZHYteD0iOTIwIiA+Cjxmb250LWZhY2UgdW5pdHMtcGVyLWVtPSIxMDAwIiBhc2NlbnQ9Ijc1MCIgZGVzY2VudD0iLTI1MCIgLz4KPG1pc3NpbmctZ2x5cGggaG9yaXotYWR2LXg9IjUwMCIgLz4KPGdseXBoIHVuaWNvZGU9IiAiICBob3Jpei1hZHYteD0iNTAwIiAvPgo8Z2x5cGggdW5pY29kZT0iJiN4MDk7IiBob3Jpei1hZHYteD0iNTAwIiAvPgo8Z2x5cGggdW5pY29kZT0iJiN4YTA7IiBob3Jpei1hZHYteD0iNTAwIiAvPgo8Z2x5cGggdW5pY29kZT0iISIgaG9yaXotYWR2LXg9IjkzNiIgZD0iTTg2NSAxMDNxMzcgLTYyIDExIC0xMDYuNXQtOTggLTQ0LjVoLTYyMXEtNzIgMCAtOTcuNSA0NC41dDExLjUgMTA2LjVsMzEwIDUzNHEzNiA2MiA4Ny41IDYydDg3LjUgLTYyek00NzEgNDZxMjMgMCAzOC41IDE2dDE1LjUgMzh0LTE1LjUgMzcuNXQtMzguNSAxNS41cS0yMiAwIC0zNy41IC0xNS41dC0xNS41IC0zNy41dDE1LjUgLTM4dDM3LjUgLTE2ek01MDkgMTg3bDI2IDMwOGgtMTI3bDI2IC0zMDhoNzV6IiAvPgo8Z2x5cGggdW5pY29kZT0iJiN4MjI7IiBob3Jpei1hZHYteD0iODY1IiBkPSJNNTIgMjg5cTEgNjUgNy41IDExNXQyNi41IDEwMS41dDUzLjUgODYuNXQ5MC41IDU4LjV0MTM1IDI4LjV2LTE1N3EtNjYgMCAtOTUgLTQ2LjV0LTI5IC0xNDcuNWwtNCAtMWg4NHExOCAwIDMxIC0xM3QxMyAtMzJ2LTI1OHEwIC0xOCAtMTMgLTMxdC0zMSAtMTNoLTIyNXEtMTggMCAtMzEgMTN0LTEzIDMxdjI1OHY3ek00OTMgMjg5cTAgNjUgNyAxMTV0MjcgMTAxLjV0NTMuNSA4Ni41dDkwLjUgNTguNXQxMzUgMjguNXYtMTU3IHEtNjcgMCAtOTYgLTQ2LjV0LTI5IC0xNDcuNWwtNCAtMWg4NHExOCAwIDMxIC0xM3QxMyAtMzJ2LTI1OHEwIC0xOCAtMTMgLTMxdC0zMSAtMTNoLTIyNHEtMTkgMCAtMzIgMTN0LTEzIDMxdjI1OHEwIDUgMSA3eiIgLz4KPGdseXBoIHVuaWNvZGU9IiMiIGhvcml6LWFkdi14PSI3NDgiIGQ9Ik03MDUgNDgycTkgLTE0IC04IC0xNGgtNDh2LTU2N3EwIC03IC01IC0xMnQtMTIgLTVoLTUxM3EtNyAwIC0xMiA1dC01IDEydjU2N2gtNTJxLTcgMCAtOS41IDR0MS41IDEwbDMxIDQ2cTkgMTQgMjcgMTRoNzV2NjZxMCAyMCAxMiAzMGw0OCA0OXExMiAxMiAzMCAxMmgyMTZxMTggMCAzMCAtMTJsNTIgLTUycTEzIC0xMyAxMyAtMzB2LTYzaDcxcTE4IDAgMjcgLTE0ek0yNDggNTQ2di00aDI1NHY0djI4cTAgMjAgLTEyIDMwbC05IDEwIHEtMTIgMTIgLTMwIDEyaC0xNTVxLTE4IDAgLTMwIC0xMmwtNiAtNnEtMTIgLTEyIC0xMiAtMzB2LTMyek01NzYgNDUwcTAgMTYgLTE2IDE4aC0yNzloLTg5cS03IDAgLTEyIC01LjV0LTUgLTEyLjV2LTQ3NnEwIC03IDUgLTEydDEyIC01aDM2N3E3IDAgMTIgNXQ1IDEydjQ3NnpNMjYzIDQxOHE3IDAgMTIuNSAtNXQ1LjUgLTEydi0zNzlxMCAtNyAtNS41IC0xMnQtMTIuNSAtNWgtMjFxLTcgMCAtMTIuNSA1dC01LjUgMTJ2Mzc5cTAgNyA1LjUgMTIgdDEyLjUgNWgyMXpNMzY0IDVxLTcgMCAtMTIuNSA1dC01LjUgMTJ2Mzc5cTAgNyA1LjUgMTJ0MTIuNSA1aDIxcTcgMCAxMiAtNXQ1IC0xMnYtMzc5cTAgLTcgLTUgLTEydC0xMiAtNWgtMjF6TTQ4NSA1cS03IDAgLTEyIDV0LTUgMTJ2Mzc5cTAgNyA1IDEydDEyIDVoMjJxNyAwIDEyIC01dDUgLTEydi0zNzlxMCAtNyAtNSAtMTJ0LTEyIC01aC0yMnoiIC8+CjxnbHlwaCB1bmljb2RlPSIkIiBob3Jpei1hZHYteD0iODkzIiBkPSJNNTAzIDI4M2gtMTA4bC0xNiA2OGgxMjR2LTY4ek02ODQgMzUxbC0xOCAtNjhoLTEwNGwxIDY4aDEyMXpNNDAwIDExOHEyOCAwIDQ4LjUgLTIwdDIwLjUgLTQ5dC0yMC41IC00OXQtNDguNSAtMjB0LTQ4LjUgMjB0LTIwLjUgNDl0MjAuNSA0OXQ0OC41IDIwek02NTkgMTE4cTI5IDAgNDkgLTIwdDIwIC00OXQtMjAgLTQ5dC00OSAtMjB0LTQ5IDIwdC0yMCA0OXQyMCA0OXQ0OSAyMHpNODMzIDUxNnEyNSAtNyAyNSAtMzNxMCAtMyAtMiAtOSBsLTg4IC0yOTNxLTcgLTI1IC0zMiAtMjVoLTQxN3EtMTIgMCAtMjEuNSA3LjV0LTExLjUgMTguNWwtODEgMzI3aC0xNDlxLTE0IDAgLTI0IDEwdC0xMCAyNHQxMCAyNHQyNCAxMGgxNzZxMjYgMCAzMyAtMjZsMTggLTczaDUwM2w1IDE1cTYgMjQgMzIgMjRxNyAwIDEwIC0xek03MTIgMjMxbDU0IDE3OWgtNDY2bDQ1IC0xODZoMzY1eiIgLz4KPGdseXBoIHVuaWNvZGU9IiUiIGhvcml6LWFkdi14PSI5MDMiIGQ9Ik04NjcgMjc3cTAgLTc5IC0zNy41IC0xNDl0LTEwMi41IC0xMTdsMTEgLTk2di00cTAgLTE3IC0xMSAtMzBxLTEzIC0xNSAtMzQgLTE1aC0xNDhxLTIxIDAgLTM0IDE1cS0xMSAxMyAtMTEgMzB2NWwyIDE4cS02IC0xIC0xOCAtMWgtMTBsMiAtMTd2LTVxMCAtMTcgLTExIC0zMHEtMTIgLTE1IC0zNCAtMTVoLTE0OHEtMjEgMCAtMzQgMTVxLTExIDEzIC0xMSAzMHY1bDExIDkwcS04NiA2MCAtMTI0IDE1M2wtNDQgLTRoLTRxLTE4IDAgLTMwIDEyIHEtMTUgMTIgLTE1IDMzdjE1MnEwIDIxIDE1IDMzcTEyIDEyIDMwIDEyaDRsNDMgLTRxMzQgODUgMTA3IDE0MWwtMiAxMTB2MXYxcTAgMjggMjUgNDNxMTEgNyAyNiA3cTE0IDAgMjUgLTdsMTI4IC03MnEyNSAzIDUxIDNxMTYwIDAgMjcwIC05OXExMTMgLTEwMCAxMTMgLTI0NHpNNjgxIDQ3cTYxIDQxIDk1LjUgMTAxdDM0LjUgMTI5cTAgMTE4IC05NCAyMDJxLTk2IDg1IC0yMzMgODVxLTI5IDAgLTUzIC00bC05IC0xbC0xMzYgNzdsMiAtMTMwIGwtMTIgLThxLTc5IC01NyAtMTA2IC0xNDRsLTcgLTIybC03NSA3di0xMjdsNzUgOGw3IC0yMnEzMyAtOTYgMTI0IC0xNTVsMTUgLTlsLTEzIC0xMTJoMTIzbC05IDc0bDM1IC00cTEzIC0yIDM5IC0ycTI0IDAgNDcgM2wzNiA0bC05IC03NWgxMjNsLTE1IDExNnpNNTAxIDUyMWw3IC0xcTcgMCAxOCAtMnQyNiAtNXQzMiAtOXQzNSAtMTR0MzcgLTIwLjV0MzYgLTI4LjVxOCAtNyA4IC0xOXQtOCAtMjBxLTggLTkgLTIwIC05cS0xMSAwIC0xOSA4IHEtMjQgMjMgLTU5IDM4LjV0LTU1LjUgMTkuNXQtMzUuNSA1aC00cS0xMSAxIC0xOSA5LjV0LTggMTkuNXExIDEyIDkuNSAyMHQxOS41IDh6TTIzMSAzODRxMTkgMjAgNDEgMjZ0MzQgLTVxMTEgLTExIDYuNSAtMzN0LTIzLjUgLTQydC00MC41IC0yNnQtMzMuNSA1dC03IDMzdDIzIDQyeiIgLz4KPGdseXBoIHVuaWNvZGU9IiYjeDI2OyIgaG9yaXotYWR2LXg9IjczMiIgZD0iTTQ2NSA0MDVoMjUwdi0xOThoLTI1MHYtMjUwaC0xOTh2MjUwaC0yNTB2MTk4aDI1MHYyNTBoMTk4di0yNTB6IiAvPgo8Z2x5cGggdW5pY29kZT0iJyIgaG9yaXotYWR2LXg9IjkwOCIgZD0iTTI2NSAxMzlxNzggNzggMTg4LjUgNzh0MTg4LjUgLTc4cTEgMCAxIC0xbC01NSAtNTVxLTEgMCAtMSAxcS01NSA1NSAtMTMzIDU1dC0xMzMgLTU1ek0xNDAgMjY0cTg1IDg1IDE5OS41IDExNS41dDIyOC41IDB0MTk5IC0xMTUuNWwxIC0xbC01NiAtNTZxMCAxIC0xIDFxLTEwNiAxMDYgLTI1Ny41IDEwNi41dC0yNTcuNSAtMTA1LjV6TTg5MyAzOTJxMCAtMiAyIC0ybC01NiAtNTZsLTIgMnEtMTA0IDEwNCAtMjQ0IDE0MXQtMjc5LjUgMCB0LTI0My41IC0xNDFxLTEgMCAtMSAtMWwtNTYgNTZsMSAxcTEyMCAxMTkgMjgwIDE2MS41dDMxOS41IDB0Mjc5LjUgLTE2MS41ek0zOTIgMTNxMjYgMjUgNjMgMjV0NjMgLTI1bC02MyAtNjN6IiAvPgo8Z2x5cGggdW5pY29kZT0iKCIgaG9yaXotYWR2LXg9IjY3MSIgZD0iTTU1MCAzNTloNzd2LTQzN2gtNTgydjQzN2g3NXYxMjhxMCA4NyA2MiAxNDl0MTQ5IDYyaDRoNHE4OCAwIDE0OS41IC02MnQ2MS41IC0xNDl2LTEyOHpNNDAyIDJsLTMyIDE0MXEzMiAyMCAzMiA1N3EwIDI4IC0xOSA0N3QtNDcgMTlxLTI3IDAgLTQ2LjUgLTE5dC0xOS41IC00N3EwIC0zOCAzMyAtNTZsLTMzIC0xNDJoMTMyek00NDUgMzU5djEyOHEwIDQzIC0zMSA3NHQtNzUgMzFoLTNoLTVxLTQzIDAgLTc0IC0zMXQtMzEgLTc0di0xMjggaDIxOXoiIC8+CjxnbHlwaCB1bmljb2RlPSIpIiBob3Jpei1hZHYteD0iODg5IiBkPSJNNjQ1IDY5OHE4OCAwIDE1MCAtNjEuNXQ2MiAtMTQ5LjV2LTEyOGgtMTA2djI5bDM2IDM0djEzaC0zNnY1MnEwIDQ0IC0zMSA3NC41dC03NSAzMC41aC0yaC01cS00NCAwIC03NSAtMzAuNXQtMzEgLTc0LjV2LTEyOGg3N3YtNDM4aC01ODR2NDM4aDQwMXYxMjhxMCA4OCA2MiAxNDkuNXQxNTAgNjEuNWgzaDR6TTM4MiAwbC0zMyAxNDJxMzMgMjAgMzMgNTdxMCAyOCAtMTkuNSA0Ny41dC00Ni41IDE5LjVxLTI4IDAgLTQ3LjUgLTE5LjUgdC0xOS41IC00Ny41cTAgLTM3IDMzIC01N2wtMzMgLTE0MmgxMzN6IiAvPgo8Z2x5cGggdW5pY29kZT0iKiIgaG9yaXotYWR2LXg9Ijc3NyIgZD0iTTczNyA0OTBsLTE5NSAtMTk1bDE5NSAtMTk2bC0xNTQgLTE1M2wtMTk1IDE5NWwtMTk1IC0xOTVsLTE1NCAxNTNsMTk1IDE5NmwtMTk1IDE5NWwxNTQgMTU0bDE5NSAtMTk1bDE5NSAxOTV6IiAvPgo8Z2x5cGggdW5pY29kZT0iKyIgZD0iTTQ2MCA3MDJxMTc0IDAgMjk3IC0xMjN0MTIzIC0yOTd0LTEyMyAtMjk3dC0yOTcgLTEyM3QtMjk3IDEyM3QtMTIzIDI5N3QxMjMgMjk3dDI5NyAxMjN6TTcwOSAyNjJ2NDFxMCAxNSAtMTAuNSAyNS41dC0yNS41IDEwLjVoLTEyMXEtMTUgMCAtMjUuNSAxMXQtMTAuNSAyNnYxMjFxMCAxNSAtMTEgMjUuNXQtMjYgMTAuNWgtNDFxLTE1IDAgLTI1LjUgLTEwLjV0LTEwLjUgLTI1LjV2LTEyMXEwIC0xNSAtMTEgLTI2dC0yNiAtMTFoLTEyMCBxLTE2IDAgLTI2LjUgLTEwLjV0LTEwLjUgLTI1LjV2LTQxcTAgLTE1IDEwLjUgLTI2dDI2LjUgLTExaDEyMHExNSAwIDI2IC0xMC41dDExIC0yNS41di0xMjFxMCAtMTUgMTAuNSAtMjUuNXQyNS41IC0xMC41aDQxcTE1IDAgMjYgMTAuNXQxMSAyNS41djEyMXEwIDE1IDEwLjUgMjUuNXQyNS41IDEwLjVoMTIxcTE1IDAgMjUuNSAxMXQxMC41IDI2eiIgLz4KPGdseXBoIHVuaWNvZGU9IiwiIGhvcml6LWFkdi14PSI5MTUiIGQ9Ik00NTggNzAxcTE3MyAwIDI5NSAtMTIyLjV0MTIyIC0yOTUuNXEwIC0xMDQgLTQ2IC0xOTFxLTU5IC0xMTUgLTE3MiAtMTc2cS05NCAtNTEgLTE5OSAtNTFxLTEwMSAwIC0xOTQgNDhxLTExNCA2MCAtMTc1IDE3M3EtNDkgOTMgLTQ5IDE5N3EwIDE3MyAxMjIuNSAyOTUuNXQyOTUuNSAxMjIuNXpNNzYwIDIwM3ExMSA0MSAxMSA4MHEwIDEzMCAtOTIgMjIydC0yMjEgOTJxLTEzMCAwIC0yMjIgLTkydC05MiAtMjIycTAgLTM5IDEyIC04NSBxMyAtOSA5IC0yNXEyMSA2IDQ1IDZxNjUgMCAxMTEuNSAtNDZ0NDYuNSAtMTExcTAgLTE3IC01IC0zN3E0IC0yIDEyIC00cTQyIC0xMSA4MyAtMTFxNDUgMCA4NyAxMnEyIDAgNS41IDJ0NS41IDJxLTUgMjIgLTUgNDBxMCA2NCA0Ni41IDExMC41dDExMC41IDQ2LjVxMjMgMCA0NCAtNnE1IDE1IDggMjZ6TTQ5OCAzMzNxMjUgLTE5IDI1IC01MHEwIC0xNCAtNSAtMjRxLTE2IC0zOSAtNTggLTM5cS0xMSAwIC0yNCA1cS0zOSAxNiAtMzkgNTggcTAgMSAwLjUgNHQwLjUgNWwtNTYgMjQ1bDIxIDl6TTQ3OCA1NjV2LTk1aC0zOXY5NWgzOXpNNjMyIDQ5MGwyNyAtMjdsLTY4IC02OGwtMjcgMjh6TTYyOSAzMDB2MzhoOTZ2LTM4aC05NnpNMTkyIDMwMHYzOGg5NXYtMzhoLTk1ek0yNDQgNDYzbDI4IDI3bDY3IC02N2wtMjcgLTI4eiIgLz4KPGdseXBoIHVuaWNvZGU9Ii0iIGhvcml6LWFkdi14PSI5MjEiIGQ9Ik00NjEgNjk4cTE3NCAwIDI5NyAtMTIzLjV0MTIzIC0yOTcuNXQtMTIzIC0yOTcuNXQtMjk3IC0xMjMuNXEtMTc1IDAgLTI5OCAxMjMuNXQtMTIzIDI5Ny41dDEyMyAyOTcuNXQyOTggMTIzLjV6TTY5NCAyNTh2MzlxMCAxOSAtMTQgMzN0LTMzIDE0aC0zNzZxLTE5IDAgLTMzIC0xNHQtMTQgLTMzdi0zOXEwIC0yMCAxNCAtMzMuNXQzMyAtMTMuNWgzNzZxMTkgMCAzMyAxMy41dDE0IDMzLjV6IiAvPgo8Z2x5cGggdW5pY29kZT0iLiIgaG9yaXotYWR2LXg9Ijk0NSIgZD0iTTE0NyAzOTJxMzcgMCA2NCAtMjd0MjcgLTY0cTAgLTM4IC0yNi41IC02NXQtNjQuNSAtMjd0LTY1IDI3dC0yNyA2NXQyNyA2NC41dDY1IDI2LjV6TTQ3MiAzOTJxMzggMCA2NSAtMjYuNXQyNyAtNjQuNXQtMjcgLTY1dC02NSAtMjd0LTY0LjUgMjd0LTI2LjUgNjVxMCAzNyAyNi41IDY0dDY0LjUgMjd6TTc5OCAzOTJxMzggMCA2NSAtMjYuNXQyNyAtNjQuNXQtMjcgLTY1dC02NSAtMjd0LTY1IDI3dC0yNyA2NXEwIDM3IDI3IDY0dDY1IDI3eiAiIC8+CjxnbHlwaCB1bmljb2RlPSIvIiBob3Jpei1hZHYteD0iOTEyIiBkPSJNNjkzIDUzN2gxODF2LTEyN3YtMzAxaC0xODF2LTUzbC0xMzYgLTEzNmgtMzM2djE4OWgtMTgxdjMwMXYxMjdoMTgxdjE2M2g0NzJ2LTE2M3pNODE2IDQ4MGgtMTA1di01M2gxMDV2NTN6TTI3NSA2NDZ2LTEwOWgzNjR2MTA5aC0zNjR6TTUwMiAtMjZ2MTM2aDEzN3YxMzF2NTVoNTR2LTEyOWg2N3YxOTdoLTYwNHYtMTk3aDY1djExMXYxOGg1NHYtNTV2LTI2N2gyMjd6IiAvPgo8Z2x5cGggdW5pY29kZT0iMCIgaG9yaXotYWR2LXg9Ijg4OSIgZD0iTTY0MyAxNjFsMzkgLTQwbDI4IC0yN3EtNDcgLTYwIC0xMTYuNSAtOTQuNXQtMTQ4LjUgLTM0LjVxLTE0MCAwIC0yMzguNSA5OHQtOTkuNSAyMzhoLTExaC0yaC02N2wxMjYgMTI2bDEyNyAtMTI2aC01MWgtMjhxMCAtMTAwIDcxLjUgLTE3MXQxNzIuNSAtNzFxNjAgMCAxMTIuNSAyNy41dDg1LjUgNzQuNXpNODEwIDMwMWg1MmwtMTI3IC0xMjZsLTEyNiAxMjZoNTBoMzB2MnEwIDEwMSAtNzEuNSAxNzIuNXQtMTcyLjUgNzEuNSBxLTYxIDAgLTExMy41IC0yOC41dC04Ni41IC03Ni41bC0zOSAzOWwtMjggMjhxNDcgNjEgMTE2LjUgOTZ0MTUwLjUgMzVxMTM5IDAgMjM4IC05OXQ5OSAtMjM4di0yaDI4eiIgLz4KPGdseXBoIHVuaWNvZGU9IjEiIGhvcml6LWFkdi14PSI3NDMiIGQ9Ik02ODggMjM1aDI5di0zMHEwIC0xNDMgLTEwMC41IC0yNDMuNXQtMjQzLjUgLTEwMC41dC0yNDQgMTAxdC0xMDEgMjQzcTAgMTQzIDEwMSAyNDR0MjQ0IDEwMXExNiAwIDI1IC0xdjc5djcxbDQ5IC01MGwxNTcgLTE1N2wyMSAtMjFsLTIxIC0yMGwtMTU3IC0xNTdsLTQ5IC01MHY3MHY4OHEtMTggMiAtMjUgMnEtODMgMCAtMTQxIC01OHQtNTggLTE0MXEwIC04MiA1OC41IC0xNDB0MTQwLjUgLTU4dDE0MCA1OHQ1OCAxNDB2MzBoMzBoODd6ICIgLz4KPGdseXBoIHVuaWNvZGU9IjIiIGhvcml6LWFkdi14PSI5MTkiIGQ9Ik00NTkgNzAxcTE3NCAwIDI5NyAtMTIzdDEyMyAtMjk3dC0xMjMgLTI5N3QtMjk3IC0xMjNxLTE3MyAwIC0yOTYgMTIzdC0xMjMgMjk3dDEyMyAyOTd0Mjk2IDEyM3pNNzI4IDM5MnE2IDYgNiAxNXQtNiAxNmwtNTUgNTRxLTYgNiAtMTUgNnQtMTYgLTZsLTI0MyAtMjQ0cS0xNSAtMTYgLTMxIDBsLTg4IDg4cS0xNiAxNiAtMzEgMGwtNTUgLTU0cS02IC03IC02IC0xNnQ2IC0xNWwxMzkgLTE0MHExNSAtMTUgMzcgLTE1aDI2cTIwIDAgMzcgMTV6ICIgLz4KPGdseXBoIHVuaWNvZGU9IjMiIGhvcml6LWFkdi14PSI4NjgiIGQ9Ik0yMiAyMzlxLTEwIDEwIC0xMCAyNHQxMCAyNGw4MyA4M3ExMCAxMCAyMy41IDEwdDIzLjUgLTEwbDEzNiAtMTM1cTEwIC0xMCAyMy41IC0xMHQyMy41IDEwbDM3MSAzNzJxMTAgMTAgMjMuNSAxMHQyMy41IC0xMGw4MyAtODJxMTAgLTEwIDEwIC0yMy41dC0xMCAtMjMuNWwtNDUwIC00NTFxLTI0IC0yNCAtNTcgLTI0aC0zOXEtMzIgMCAtNTYgMjR6IiAvPgo8Z2x5cGggdW5pY29kZT0iNCIgaG9yaXotYWR2LXg9Ijc2MiIgZD0iTTU5IDcwMGw3MDIgLTM1MWwtNzAyIC0zNTB2NzAxeiIgLz4KPGdseXBoIHVuaWNvZGU9IjUiIGhvcml6LWFkdi14PSI4MTYiIGQ9Ik01OSAxdjY5OGgyNjJ2LTY5OGgtMjYyek00OTUgNjk5aDI2MnYtNjk4aC0yNjJ2Njk4eiIgLz4KPGdseXBoIHVuaWNvZGU9IjYiIGhvcml6LWFkdi14PSI4MTciIGQ9Ik03NTggMmgtNjk5djY5OGg2OTl2LTY5OHoiIC8+CjxnbHlwaCB1bmljb2RlPSI3IiBob3Jpei1hZHYteD0iOTIyIiBkPSJNNDIzIDQxN3YxODJsNDg1IC0yNDNsLTQ4NSAtMjQydjE4MWwtMzY0IC0xODF2NDg1eiIgLz4KPGdseXBoIHVuaWNvZGU9IjgiIGhvcml6LWFkdi14PSI5MjIiIGQ9Ik01MDAgMjk1di0xODJsLTQ4NiAyNDNsNDg2IDI0MnYtMTgybDM2MyAxODJ2LTQ4NXoiIC8+CjxnbHlwaCB1bmljb2RlPSI5IiBkPSJNNDYwIDcwMHExNzQgMCAyOTcgLTEyM3QxMjMgLTI5N3QtMTIzIC0yOTd0LTI5NyAtMTIzdC0yOTcgMTIzdC0xMjMgMjk3dDEyMyAyOTd0Mjk3IDEyM3pNMjk4IDY0bDQzMSAyMTZsLTQzMSAyMTZ2LTQzMnoiIC8+CjxnbHlwaCB1bmljb2RlPSI6IiBob3Jpei1hZHYteD0iODAxIiBkPSJNNjcxIDEwMGwxMDUgLTEwMnEwIC0xNiAtMTIgLTI4LjV0LTI5IC0xMi41aC0yNDJxMSAtNCAxIC0xMnEwIC0zOSAtMjcuNSAtNjYuNXQtNjYuNSAtMjcuNXQtNjYuNSAyNy41dC0yNy41IDY2LjVxMCAyIDAuNSA2dDAuNSA2aC0yNDFxLTE2IDAgLTI4LjUgMTIuNXQtMTIuNSAyOC41bDEwNSAxMDJxLTEgOCAtMSAyNXYyMDhxMCA4OCA1MC41IDE1OHQxMzAuNSA5OHEtNCAxMSAtNCAyNnEwIDM5IDI3LjUgNjYuNXQ2Ni41IDI3LjUgdDY2LjUgLTI3LjV0MjcuNSAtNjYuNXEwIC0xNCAtMyAtMjZxODAgLTI4IDEzMC41IC05OC41dDUwLjUgLTE1Ny41di0yMDhxMCAtMTcgLTEgLTI1ek0zNDggNjE1cTAgLTUgMiAtMTVxMjggNSA1MCA1cTIzIDAgNTAgLTVxMyA4IDMgMTVxMCAyMiAtMTUuNSAzN3QtMzcuNSAxNXQtMzcgLTE1dC0xNSAtMzd6IiAvPgo8Z2x5cGggdW5pY29kZT0iOyIgaG9yaXotYWR2LXg9Ijg4NyIgZD0iTTI5OSA0MThsLTQyIC00NHEtNCAtNSAtMTEgLTEyLjVsLTEyLjUgLTEzLjVsLTEwLjUgLTExcS0xOCAxNiAtMjcgMjNxLTQ5IDQwIC04MSA0MGgtMTAxdjExMmgxMDFxNTkgLTEgMTE4IC00MXEzMyAtMjEgNjYgLTUzek0zOTkgMTU2bDQ0IDQ3bDMyIDM0cTE2IC0xNCAyNiAtMjJxNTIgLTQyIDg0IC00MGg4NnY5NGwxNzUgLTE0OGwtMTc1IC0xNDZ2ODhoLTg2cS01NiAwIC0xMjAgNDBxLTI3IDE3IC02NiA1M3pNNTgyIDQwMCBxLTIzIDAgLTU2IC0yMnEtMzUgLTIzIC03OCAtNjhxLTE5IC0xOSAtNTQuNSAtNTcuNWwtNjYuNSAtNjkuNXQtNjAgLTU1cS04MCAtNjQgLTE1NCAtNjVoLTk5djExMmg5OXEyNiAwIDU5IDIycTI5IDE4IDc5IDY4cTUgNSA3MyA3Ny41dDEwNyAxMDQuNXE4MSA2NCAxNTIgNjVoODh2OTJsMTc1IC0xNDdsLTE3NSAtMTQ3djkwaC04OGgtMXoiIC8+CjxnbHlwaCB1bmljb2RlPSImI3gzYzsiIGhvcml6LWFkdi14PSIzOTUiIGQ9Ik0xMTUgNDEwbDIyMiAyMjN2LTY2OGwtMjIyIDIyMmgtMTEydjIyM2gxMTJ6IiAvPgo8Z2x5cGggdW5pY29kZT0iPSIgaG9yaXotYWR2LXg9Ijk0NyIgZD0iTTg5NiAzNzl2LTE3NmwtNjMgLTI1di0xMDhoLTc3M3Y0NDJoNzczdi0xMDl6TTc2MCAxNDR2Mjk0aC02MjZ2LTI5NGg2MjZ6TTM3MyAzOTBsMjIyIC0xOThoLTQxM3YxOThoMTkxeiIgLz4KPGdseXBoIHVuaWNvZGU9IiYjeDNlOyIgaG9yaXotYWR2LXg9Ijg4OSIgZD0iTTEyNiA0MDhsMjIyIDIyM3YtNjY4bC0yMjIgMjIyaC0xMTJ2MjIzaDExMnpNNDM0IDQzOHE3NSAtNTAgNzUgLTE0MHQtNzUgLTEzOWwtMzQgNjdxMzUgMjggMzUgNzJ0LTM1IDcydjJ6TTY4MCAyOThxMCAtOTIgLTQ2IC0xNjguNXQtMTIzIC0xMjAuNWwtMzQgNjZxNTkgMzQgOTQgOTMuNXQzNSAxMjkuNXQtMzUgMTI5LjV0LTk0IDkzLjV2MmwzMyA2NXE3NyAtNDQgMTIzLjUgLTEyMS41dDQ2LjUgLTE2OC41ek01ODcgNzM4IHExMTggLTY2IDE4OC41IC0xODN0NzAuNSAtMjU3dC03MC41IC0yNTd0LTE4OC41IC0xODJsLTMzIDY2cTk5IDU2IDE1OC41IDE1NS41dDU5LjUgMjE3LjV0LTU5LjUgMjE3LjV0LTE1OS41IDE1NS41eiIgLz4KPGdseXBoIHVuaWNvZGU9Ij8iIGhvcml6LWFkdi14PSI5MjIiIGQ9Ik00NjEgNzAycTE3NSAwIDI5OCAtMTIzLjV0MTIzIC0yOTcuNXQtMTIzIC0yOTcuNXQtMjk4IC0xMjMuNXEtMTc0IDAgLTI5Ny41IDEyMy41dC0xMjMuNSAyOTcuNXQxMjMuNSAyOTcuNXQyOTcuNSAxMjMuNXpNNDg5IDI5cTE5IDE4IDE5IDQ3dC0xOSA0N3EtMjAgMTcgLTQ5IDE3cS0yOCAwIC00OCAtMTdxLTIwIC0yMCAtMTggLTQ3cS0yIC0yNyAxOCAtNDdxMTkgLTE3IDQ4IC0xN3EzMiAwIDQ5IDE3ek02MDIgMzUxcTEwIDI0IDEwIDYyIHEwIDU4IC00MSA5M3EtMzggMzQgLTEwOCAzNHEtNDkgMCAtODUgLTEycS0zMyAtMTEgLTYzIC0zMWwtOSAtNmw0NiAtODdsMTAgOHEyIDEgMTkgMTFxNyA0IDIzIDEwcTEwIDQgMjMgNnE3IDIgMjEgMnEzMCAwIDM4IC0xMHExMSAtMTEgMTEgLTMxcTAgLTEzIC03IC0yNXEtMTIgLTE2IC0yMSAtMjRxLTQgLTQgLTguNSAtOGwtMTAgLTl0LTkuNSAtOHEtMTcgLTE2IC0zMCAtMzRxLTEyIC0yMCAtMjAgLTQ2cS01IC0yMiAtNSAtNDEgcTAgLTQgMC41IC0xMnQwLjUgLTEybDEgLTExaDExaDg4djEycTAgMjYgOCA0MnE5IDE2IDIxIDMwcTE0IDE0IDI5IDI1dDMyIDMwcTE0IDE3IDI1IDQyeiIgLz4KPGdseXBoIHVuaWNvZGU9IkAiIGhvcml6LWFkdi14PSI1MDgiIGQ9Ik0yNTggNzAzcTkyIDAgMTU3LjUgLTY2dDY1LjUgLTE1N3EwIC0xMDcgLTIwMyAtNTQ2bC0yNCAtNTBsLTYzIDEzNXQtMTAxIDI0NC41dC02MyAyMTYuNXEwIDkyIDY1LjUgMTU3LjV0MTU3LjUgNjUuNWg0aDR6TTI1NCAzOTdxNDIgMCA3MiAzMHQzMCA3M3EwIDQyIC0zMCA3MnQtNzIgMzBxLTQzIDAgLTczIC0zMHQtMzAgLTcycTAgLTQzIDMwIC03M3Q3MyAtMzB6IiAvPgo8Z2x5cGggdW5pY29kZT0iQSIgaG9yaXotYWR2LXg9Ijg5MyIgZD0iTTMxNSAyOTlsNzAgLTcwcS0zOCAtMzIgLTg4LjUgLTMwdC04Ni41IDM4bC0xNDQgMTQ0cS0zOCAzNyAtMzggOTF0MzggOTFsOTkgOTlxMzggMzggOTEuNSAzOHQ5MS41IC0zOGwxNDQgLTE0NHEzNiAtMzYgMzcuNSAtODYuNXQtMzAuNSAtODguNWwtNzAgNjlxMTAgMjAgLTYgMzhsLTE0NCAxNDRxLTkgOSAtMjIuNSA5dC0yMi41IC05bC05OSAtOTlxLTEwIC0xMCAtMTAgLTIzdDEwIC0yM2wxNDQgLTE0NHExNiAtMTYgMzYgLTZ6TTcyOCAtOTkgcS0zOCAtMzcgLTkxIC0zN3QtOTEgMzdsLTE0NSAxNDVxLTM1IDM1IC0zNyA4NS41dDMwIDg4LjVsNjkgLTcwcS05IC0yMCA3IC0zNmwxNDQgLTE0NHE5IC0xMCAyMi41IC0xMHQyMi41IDEwbDk5IDk5cTEwIDkgMTAgMjIuNXQtMTAgMjIuNWwtMTQ0IDE0NXEtMTYgMTYgLTM3IDVsLTY5IDcwcTM4IDMyIDg4LjUgMzAuNXQ4Ni41IC0zNy41bDE0NCAtMTQ0cTM3IC0zOCAzNyAtOTEuNXQtMzcgLTkxLjV6TTI2MyA0NjVxMTQgMTQgMzQgMTQgdDM0IC0xNGwyOTUgLTI5NXExNCAtMTQgMTQgLTM0dC0xNCAtMzR0LTM0IC0xNHQtMzQgMTRsLTI5NSAyOTRxLTE0IDE0IC0xNCAzNC41dDE0IDM0LjV6IiAvPgo8Z2x5cGggdW5pY29kZT0iQiIgaG9yaXotYWR2LXg9Ijg4MSIgZD0iTTczNCAzMTFxLTE0IC0yNyAtNDIgLTUwcS0xMiAtMzAgLTMxLjUgLTU4dC01NC41IC02MHQtOTIuNSAtNTEuNXQtMTI5LjUgLTE5LjVxLTc3IDAgLTE0My41IDIxdC0xMDUuNSA1MXQtNjcgNjB0LTM5IDUxbC0xMSAyMXE1IC0zIDE0LjUgLTYuNXQzOC41IC0xMS41dDU4IC0xMnQ3MCAtMC41dDc4IDE3LjVxLTY0IDI3IC05NiA5MXEtMjEgNDMgLTggNTRxNyA3IDI1IC0xMHE1MyAtNTAgMjEyIC00MXE3IDggMjEgMjZ2NXEwIDY3IDQ3IDExNCB0MTE0IDQ3cTY0IDAgMTEwIC00My41dDUxIC0xMDYuNWwxMDIgLTQ5ek02MjYgNDY5cS0xOSAwIC0zMiAtMTMuNXQtMTMgLTMyLjV0MTMgLTMydDMyIC0xM3QzMi41IDEzdDEzLjUgMzJ0LTEzIDMyLjV0LTMzIDEzLjV6IiAvPgo8Z2x5cGggdW5pY29kZT0iQyIgaG9yaXotYWR2LXg9IjkxMyIgZD0iTTc3MSAzMTdxNDYgLTE4IDc0IC01OS41dDI4IC05Mi41cTAgLTY4IC00OC41IC0xMTYuNXQtMTE2LjUgLTQ4LjVxLTIgMCAtNSAwLjV0LTQgMC41aC00OTRoLTFoLTJxLTY5IDEgLTExNy41IDUwdC00OC41IDExOXEwIDQ1IDIyLjUgODMuNXQ2MC41IDYwLjVxLTYgMTYgLTYgMzVxMCA0NyAzNCA4MXQ4MSAzNHEzOCAwIDcxIC0yNXEzMSA2NCA5MSAxMDN0MTMzIDM5cTEwMyAwIDE3NiAtNzIuNXQ3MyAtMTc2LjVxMCAtMTAgLTEgLTE1eiIgLz4KPGdseXBoIHVuaWNvZGU9IkQiIGhvcml6LWFkdi14PSI5MTciIGQ9Ik00NTkgNjk4cTE3MyAwIDI5NS41IC0xMjN0MTIyLjUgLTI5NnQtMTIyLjUgLTI5NS41dC0yOTUuNSAtMTIyLjV0LTI5NiAxMjIuNXQtMTIzIDI5NS41dDEyMyAyOTZ0Mjk2IDEyM3pNNTc0IDI1MnEtMTEgMTIgLTExIDI4dDExIDI4bDEwOSAxMDhxMTEgMTIgMTEgMjguNXQtMTEgMjcuNWwtMzEgMzFxLTEyIDExIC0yOC41IDExdC0yNy41IC0xMWwtMTA4IC0xMDlxLTEyIC0xMSAtMjguNSAtMTF0LTI3LjUgMTFsLTEwOSAxMDkgcS0xMSAxMSAtMjcuNSAxMXQtMjcuNSAtMTFsLTMxIC0zMXEtMTEgLTExIC0xMSAtMjcuNXQxMSAtMjguNWwxMDkgLTEwOHExMSAtMTIgMTEgLTI4dC0xMSAtMjhsLTEwOSAtMTA4cS0xMSAtMTIgLTExIC0yOC41dDExIC0yNy41bDMxIC0zMXExMSAtMTEgMjcuNSAtMTF0MjcuNSAxMWwxMDkgMTA5cTExIDExIDI3LjUgMTF0MjguNSAtMTFsMTA4IC0xMDlxMTEgLTExIDI3LjUgLTExdDI4LjUgMTFsMzEgMzFxMTEgMTEgMTEgMjcuNXQtMTEgMjguNXogIiAvPgo8Z2x5cGggdW5pY29kZT0iRSIgaG9yaXotYWR2LXg9Ijg5NSIgZD0iTTQ0OCA1MzFxNjMgMCAxMjkuNSAtMjMuNXQxMTUuNSAtNTd0ODkuNSAtNjd0NjEuNSAtNTcuNWwyMSAtMjN2LThsLTIyIC0yNC41dC01OS41IC01NC41dC05MiAtNjl0LTExNCAtNTQuNXQtMTMwLjUgLTI0LjV0LTEyOS41IDIzLjV0LTExNS41IDU3dC04OS41IDY3dC02MS41IDU2LjVsLTIxIDI0djlsMjIgMjQuNXQ1OS41IDU0LjV0OTIgNjguNXQxMTQgNTR0MTMwLjUgMjQuNXpNNDQ2IDE1OHE1OCAwIDk4LjUgNDAuNXQ0MC41IDk4LjUgcTAgNTcgLTQwLjUgOTcuNXQtOTguNSA0MC41cS01NyAwIC05Ny41IC00MC41dC00MC41IC05Ny41cTAgLTU4IDQwLjUgLTk4LjV0OTcuNSAtNDAuNXpNNDQ2IDM2MXEyNiAwIDQ1IC0xOXQxOSAtNDV0LTE5IC00NC41dC00NSAtMTguNXQtNDQuNSAxOC41dC0xOC41IDQ0LjV0MTguNSA0NXQ0NC41IDE5eiIgLz4KPGdseXBoIHVuaWNvZGU9IkYiIGhvcml6LWFkdi14PSI3MDQiIGQ9Ik0yMjQgNzAwaDQyMnYtODE4aC01OTN2NjQ2bDE3MSAxNzF2MXpNNTc4IC01MHY2ODJoLTI4NXYtMTcyaC0xNzJ2LTUxMGg0NTd6IiAvPgo8Z2x5cGggdW5pY29kZT0iRyIgZD0iTTQ2MCA2OThxMTc0IDAgMjk3IC0xMjN0MTIzIC0yOTd0LTEyMyAtMjk3dC0yOTcgLTEyM3QtMjk3IDEyM3QtMTIzIDI5N3QxMjMgMjk3dDI5NyAxMjN6TTczOCA0MDFsLTEgLTNxLTEgLTMgLTEgLTUuNXQyIC0yLjVxMCAtMiAzIC02dDMgLTh2LTExcTEgLTIgNSAtM3ExIC00IDYgLTV0NiAzcS0zIDAgLTIuNSA0LjV0LTAuNSA0LjVxMCAyIC0xIDNxLTIgMiAtMiAzaDdxMCAyIC0yIDV0LTIgNHEtMSAwIC0yLjUgLTF0LTIgLTF0LTAuNSAyIHQtNCA2bC0yIDdxMyAwIDYgMXEtMSAwIDQgMnEtMSAxIC0yIDRxLTIgNCAtNyAycS0yIDAgLTUgLTIuNXQtNSAtMi41ek03MzUgODFxNjMgOTAgNjMgMTk3cTAgMTkgLTEgMjhxLTkgMCAtMTMgMnEtNCAwIC0xNC41IDQuNXQtMTYuNSAyLjVxMCAxIC0xIDFxMiAzIC01IDExcS01IDQgLTcgMHEtMiAtMyA1IC0xMHEwIC0yIDIgLTZxMiAtMSAxIC0zdC0xIC0zcTQgMCA1IDdxMCAtMSAxIC0xcS0yIC0zIDEgLTZ2LTVxMTAgMCAxNCAxMCBxMSAwIDEgLTJ0MSAtM3EzIC0zIDIgLTV0MiAtMnEyIC0xIDIgMXYycTQgLTIgNCAtNnQtNCAtNnEwIC0xIC0xIC0zdC0xIC00cTAgLTYgLTQgLThsLTQgLTJxLTQgLTMgLTggLTUuNXQtNCAtMy41cS0xMiAwIC0xNSAtN3EtNyAwIC0xMSAtNHEtNiAwIC04LjUgNnQtNC41IDZsLTIgNXExIDAgLTEuNSA2bC01LjUgMTN0LTMgOWwtNSAxMHEtMiAxIC03IDEycS04IDQgLTEwIDEzcTEwIDAgMTAgNHEtMSAwIC0yIDFxLTIgMiAxIDJsMyA5IHEwIDEgMSA1LjV0MSA2LjVxLTIgMCAtOCAtMnEwIC0xIC0xLjUgLTAuNXQtMy41IDAuNWwtMyAxcTAgMSAtNi41IDB0LTguNSAycS0yIDIgLTQgMTRxLTEgMyAtOCAzcS0zIDEgLTMuNSAtMXQwLjUgLTVsMSAtNHEyIDAgLTIgLTdxLTEgLTEgLTEgLTJxLTQgMSAtNiA2dC00IDZxLTEgNCAtMyA0cTAgMTAgLTEgMTBsLTMgMXEtNCAyIC01IDNxLTIgMCAtNS41IDMuNXQtNi41IDUuNXQtNCAwbDMgLTZxMiAwIDUgLTQuNXQ3IC0zLjV2LTUgcTMgMSA0LjUgLTEuNXQyLjUgLTIuNXEwIC0xIC0zIDBxLTQgMiAtMyAtMXEyIC02IC00IC05cTAgMTIgLTMgMTJxLTIgMyAtNyA1dC02IDRxLTEgMCAtMy41IDMuNXQtNC41IDQuNXEtMiAtMiAtNSAtMnEtMSAtMiAtNC41IC0yLjV0LTcuNSAwLjVsLTMgMXEtNyAtMTggLTggLTIwcS0xIC0zIC0zIC01dC0zIC01cTAgLTEgLTcuNSAtMS41dC03LjUgLTEuNXEtMTEgNCAtMTEgMTN2NXQxIDl0MSA2bDIgLTJoMy41aDQuNXQzLjUgMXQxLjUgMiBxNCAwIDMgLTRxOSAtMyA5IDNxLTIgMCAtMiAycTMgNCAyIDd0LTQgNnQtMyA0bC00IDRxOSAtNiAxMSAtMXEwIDEgLTEgM3YxcTIgLTIgMy41IC0yLjV0Mi41IDEuNXEyIDEgMyAzdjZxMyAtNCA0LjUgMHQyLjUgNXEwIC0zIDMgMHEyIDIgMyAycTEgMiA1IDIuNXQ1IDMuNXEtMyAxIC0zIDEycTIgMCA0LjUgMS41dDMuNSAxLjV0MiAtMnEwIC02IDEgLTZxNCAyIDQgNXEtMiAwIC01IDEwcS0zIDAgLTUgLTJxLTMgMCAtNy41IDF0LTYuNSAxIHEtNyA3IC02IDdxLTIgNCAyIDVoMnEwIDIgMTEuNSA1dDEyLjUgOHEtNiAwIDggMTNxMTAgOCAxNCA4cTEgMCA5LjUgMmwxNC41IDMuNXQ4IC0wLjVxMjIgMCAyMiAtMnExIDAgMy41IC0xdDQgLTEuNXQzLjUgMC41cTMgMiAxMSAtMnQ4IC04cS0zIDAgLTEyIC0xdC0xNCAtMXYtMnEyIDAgNS41IC00LjV0Mi41IC02LjVxMyAwIDYgMnQ0IDJxMCAtMiAxIC0zcTMgLTIgNCAzbC0xIDRxMSAyIDQuNSAyLjV0NC41IDMuNXEtNDcgNTYgLTExNC41IDg4IHQtMTQzLjUgMzJxLTEzNCAwIC0yMzEgLTkxcTEgLTEgNSAybDIgMXEwIC02IDEgLThsMyAtN3E4IDAgOSAtMmgtNXExIC02IC0zIC00cS0zIDEgLTQgMXEwIDEgLTMgMnQtNSAwdDAgLTVxMSAwIDIgLTF0MyAtMnEyIDAgNi41IC0xdDYuNSAtMnEyIDAgNSAwLjV0NCAwLjVxMiAxIDMgMnQtMSAycTEgMiAtNCA0cTAgMSAxMSAxcTIgMiAxLjUgMy41dDAuNSAzLjV0NCAydDQgM3E0IC0yIDUgLTZxMSAwIDMgLTNxOSAtMTAgOSAtM3E2IC0xIDYgLTExIHE3IDEgNyAxMXEtMSAwIC0xIDNoNHEyIC0xIDIgMXExIDAgMSAtMmg4di0xMXEwIC0yIC0yIC0zdC0zIC0xbC0yIC0xcS0zIC00IC0xLjUgLTV0Ni41IC0zLjV0NiAtMy41bC04IDFxLTEgMCAtNC41IC0wLjV0LTYgLTF0LTQuNSAwLjVxNSAwIDcgMTFxLTggMiAtMTEgLTVxLTEgLTQgLTQgLTMuNXQtNCAtMS41bC0yIC0xcS0zIC0xIC01IC0xLjV0LTIgMC41cS03IC0yIC03IC0xN3ExMSAtOCAxMSAtMTJxNCAtMSA5LjUgLTJ0OC41IC0xIHExIC0zIDQgLTNxMCAtNCA5IC00cTAgNiA2IC00cTEgLTIgMSAtM3EtMSAwIDAgLTIuNXQzIC01LjVxLTIgMCAtMSAtMXEyIC0yIDUuNSAtMXQzLjUgM3EtMiAwIC0yIDZxLTYgNiAxIDhxMCAtNCA2IDFxMiAyIC0xIDNxMiA5IDAgMTJxLTEgMSAtMi41IDF0LTIuNSAycTQgMSAxIDE0aDVxMiAwIDUuNSAtMS41dDUuNSAtMXQzIDMuNXEzIC0yIDQuNSAtNXQ0LjUgMXEwIC0xIDQgLTUuNXQ1IC00LjVxMCAtMyAyIC0zbC0xIC0ycTcgMCA3IDEgcTYgMCA2IDhxMSAwIDIuNSAtM2wzIC02dDIuNSAtM2wyLjUgLTIuNWwzIC0zdDIuNSAtM3QxIC0yLjVxMiAtMiAyIC01cTEgMCAyIDJxMyAzIDMgLTFxMiAwIDQuNSAtMi41dDIuNSAtMy41cS0yIDAgLTEuNSAtMnQtMC41IC0ycTAgLTEgLTExIC0xcS0xIC01IC02IC02dC0xMSAwLjV0LTExIC0wLjVxLTQgLTIgLTkuNSAtOC41dC01LjUgLTEwLjVxMyAwIDcuNSAzLjV0Ni41IDQuNXEyIDAgMTAgNHEwIC0xIDEgLTF2LTFxLTYgMCAtMiAtNyBxMSAtMSAxIC0ycTMgLTUgOCAtNXEwIC0xIC0yLjUgLTF0LTIuNSAtMmwtNSAtM2gtNmwxIDFsMSAxaDN2NHEtMyAwIC02IC0xLjV0LTUgLTEuNXEtNCAtNCAtNiAtNHEtMiAtMTAgLTYgLTEybC0yIC0xbC00IC0ybC0yIC0ybC0yIC0ycS0xIC0yIC0yIC01cS0zIC03IC0zIC05cS0xIDAgLTMuNSAtNS41dC02LjUgLTUuNXEtMSAtMiAtNS41IC02dC00LjUgLTEwcTEgLTEgMS41IC00dDEuNSAtNi41dDEgLTQuNXEwIC04IC00IC04bC0yIDN0LTEgMyBxMCA0IC00IDEycTAgMiAtNC41IDEuNXQtNS41IC0wLjVxLTEgMyAtMTMgM3EwIC0xIDEgLTJ0MSAtM3EtNiAtMiAtNyAtMnEtMiAwIC00LjUgMi41dC01LjUgMS41cS0xNCAtMiAtMTQgLTE2cS0xIDAgLTEgLTguNXQxIC04LjVxMCAtMiAyIC02dDIgLTVxMiAwIDYgLTR0NSAtNHExIC00IDUgLTRsMiAxbDIgNHEtMyAxIC0xLjUgMy41dDMuNSAzLjVxMCAtMiA2IDJsNiAybDIgMnExIC0zIC0xIC00cS0yIDAgLTMgLTNsLTEgLTIgcS0xIC0yIC0yIC01dC0xIC01dDEgLTQuNXQwIC00LjVoMTN2M3EzIDAgMi41IC02LjV0MS41IC02LjVxMCAtMiAxIC02dDEgLTVxNSAtMyA0IC04cTEyIDAgMTIgM3E3IDAgNSAtN3E1IDAgNiAzdDEgNS41dDIgMi41cTAgMyAyIDFsNiAzbDMgMnEyIC0xIDIgLTJxNSAwIDkgNHEyIDAgNCAtNXQ2IC01cTEyIDAgMTMgMXEzIC0yIDMgLTNxMSAwIDIgLTFsMSAtMWgxbDQgLTRxMCAtMiAyLjUgLTN0Mi41IC0ybDEgLTFsMyAtMmw5IC0zcTEgMyA0IDAgcTEgLTEgMiAtMWwyIC0ycTEgLTEgNCAtN3EyIC0yIDQgLTExcS0xIDAgLTEgLThsNCAtMXEyIDAgMiAycTIgMCA1IC0ydDQgLTJxLTIgLTIgMSAtMy41dDMgMi41cTMgMCAzIC0xMXEyIDAgNC41IDEuNXQ0LjUgMS41cTYgMCA2IDFxOCAtMiAxMyAtOHE1IC01IDUuNSAtMTR0LTQuNSAtMTRsLTggLTEwcTAgLTEyIC0xIC0xMnEwIC0xNCAtMyAtMTRxMCAtMyAtMi41IC03dC0zLjUgLTZxLTEgLTEgLTYuNSAtNC41dC02LjUgLTUuNSBxLTEgMCAtNCAtMXQtNCAtMWwtMiAtM3EtMyAtMyAtMiAtM3EwIC0xIC0wLjUgLTcuNXQtMS41IC04LjVxLTQgLTIgLTMgLTRxLTEgMCAtMS41IC0xdC0zLjUgLTFxLTIgMCAtNSAtMi41dC0zIC01LjVxLTIgLTggLTYgLTExbC0zIC0ycS00IC0yIC00IC00di04cS02IDAgLTggLTRxLTQgMCAtMTEgLTRxMCAtNCAtMiAtNHEwIC00IC0zIC0zdC00IDBxMiAwIDIgLTZxMCAtMSAtNiAtOWwtMSAtMnEtMiAtMyAtMyAtM3EwIC0xIC0wLjUgLTQgdC0wLjUgLTV2LTNsMiAycTAgMSAyIC0xcS0xIC0yIC0zIC00dC0zIC01cS01IDAgLTUgLThxMCAtMiAxIC0ycTAgLTEgMiAtNWwtMjcgOXEwIDM3IDQgMzdxMCA5IDIgOXYxNHEtMSAyIDEuNSA2LjV0Mi41IDYuNXEzIDEgMy41IDEwdDAuNSAxN3QyIDhxMCA0IDEuNSAyMC41dC0wLjUgMjAuNWwtNyA4cS01IDAgLTkgNi41dC00IDEyLjVxLTMgOSAtMyAxMHExIDAgLTIgNC41dC02IDkuNWwtNCA1cS0zIDMgLTMgNC41dDIgNXQyIDYuNSBxLTQgMiAtMiAxMC41dDUgOC41cTAgMyAzIDRxMSAtMyAzIC0ycTMgMyAwIDV2MTNxMCAxMCAtNSAxMHEtMiAwIC00IC01cS0xIDEgLTUgMS41dC03IDJ0LTMgNC41cTIgNiAtOCAxMXExIDQgLTUuNSA4LjV0LTEwLjUgNC41cTAgMSAtMiAxLjV0LTIgMS41cS0yIDAgLTUgM3QtNiAzcS00IDAgLTEwIDIuNXQtOSAyLjVxLTEgMiAtNi41IDN0LTYuNSAzcS03IDAgLTcgMTNxMCAxOCAtOSAxOHEwIDMgLTQgNi41dC02IDMuNXEtMyA3IC01IDcgcTAgNCAtNiA5cS0zIDIgLTMgMHEtMSAtMiAyLjUgLTUuNXQzLjUgLTUuNXExIDAgOCAtMTNxNiAtMTAgMyAtMTFxLTQgLTEgLTEwIDhxLTIgNCAtMiA2cS0yIDEgLTQuNSA2LjV0LTIuNSA3LjVxLTEgMSAtMi41IDR0LTIuNSA2bC0xIDJxMCAxMCAtMTEgMTBsLTcgOXEwIDEwIC04IDEzcTAgMiAtMSA5dDAgMTBxMCAyMyAtMTAgMzFxLTMzIC02OCAtMzMgLTE0NHEwIC0xNDAgOTkuNSAtMjM5dDIzOS41IC05OXE4MiAwIDE1MyAzN3QxMTggMTAwIHEtNyAtMiAtOSA5cS0zIDE3IDIgMzJxNSAtMiA2IDBxLTQgMSAtMiA2cTEwIC03IDEwIDJsLTIgMnEwIDIgMSAzdDEuNSAwLjV0MC41IC0yLjVxMyAwIDMuNSA0LjV0MS41IDUuNXEwIC0xMSAzIC0xMnEyIC0yIC0wLjUgLTQuNXQtMi41IC0zLjVxLTIgLTEgLTIgLTZoLTNxMCAtMyAtMSAtOC41dC0xIC03LjVxLTIgMCAtMiAtMTZ6TTY2NiAzODNxMiAtMSAyIC00cTI1IDAgMjUgM3ExIC0yIDIgLTN0MiAycTEgMCA0LjUgLTN0Ny41IC0ybDcgNCBsLTIgMXEwIDYgLTUgOS41dC02IDQuNXEtMSAwIC0zLjUgMXQtNC41IDFxLTMgMiAtNiAtMXEtMyAtMiAtMyAwcS0xIDIgLTMgMnEwIDggLTkgN3EtMSAtMyAtMy41IC03dC0zLjUgLTcuNXQtMSAtNy41ek01MTggNDkxcTAgLTUgLTEgLTVxLTUgLTMgLTEwIC0zaC0xMXEtMiAwIC0xMCAycTAgMSAxIDJxMyA0IC0xIDRxNyAzIDggM3YtMXYtNHEwIC0xIDIgLTAuNXQ0LjUgMXQzLjUgMS41cTMgMCA2IDFxMSAxIDEuNSAwLjV0MC41IC0zLjV6IE01NTEgNDQ0cTAgMiAtMSA0dC0xIDRxMCAzIDMgMi41dDQgMy41cTMgLTEgMCAtM3YtNHEyIDAgNCAydDMgMnEtMiAtNyAtMSAtOHE1IC01IDQgLTZxNyAwIDUgLTExcTMgMCAzIDNxMiAtMSAyIC0yLjV0LTIgLTEuNXEtMyAtNSAtMTUgLTVxMCA2IC00IDNxLTMgLTEgLTIgNHExIDIgMSAzcS0yIDEgNSAycS0xIDggLTggOHpNNTM2IDQyOHEtMiAyIDAgOHEtMyAxIDEgMmw1IDJxLTQgMCAtMiA0aDJxMSAtMiAyIC0xaDRxMSAtMSAwIC0zIHEtMyAtMTIgLTEyIC0xMnpNNTUxIDQyMnExIDAgMSAxaDNxMCAtMiAtMS41IC0ydC0yLjUgMXpNMzkyIDQwMXExIDEgNCAzcTAgLTMgLTQgLTN6TTU5OCAzODhxMiAwIC0xIC02cS0xIDIgLTIgNXEzIDAgMyAxek01OTggMzgwcTIgMCAxLjUgLTQuNXQtNS41IC0zLjVxMCA3IDIgN2wxIC0ycTEgMSAxIDN6TTYyMCAzNjVxMCAtNCAtMSAtNC41dC00LjUgMS41dC01LjUgMmg1cTEgLTEgNiAxek03MjggMjQwcTYgMCA2IDFxMTAgMCAxNiAzIHEwIC00IC0yLjUgLTkuNXQtMS41IC05LjVxLTMgMCAtMyAtNWwtMiAtMnEtMiAtMyAtNCAtNHEwIC0yIC05IC0xMXEtMSAtMiAtNS41IC02LjV0LTUuNSAtNi41cS0xNCAtMTQgLTEwIC0xNHEwIC0yNCAyIC0yNGwxIC02cTEgLTYgMSAtMTB0LTEgLTVxMCAtMyAtMiAtNy41dC0yIC02LjVsLTIgLTFsLTMgLTNxLTIgMCAtNCAtMy41dC0zIC0zLjVxMCAtNCAtMSAtMTF0LTEgLTExbC0xIC00bC0yIC02bC0xIC00cS0xNSAtOCAtMTUgLTE3IHEtNyAtMTAgLTggLTEycS0xOSAwIC0xOSAtNGgtMTVxMCAyIC0xIDZ0LTEgN3EtMSAwIC0yIDMuNXQtMiAzLjVxMCAxIC0yLjUgNi41dC00LjUgMTF0LTEgNS41cTAgOSAtMyA5cTAgNCAtMi41IDExdC0yLjUgMTBxLTEgMCAtMiA0dC0xLjUgNy41dDAuNSA0LjVxMCA0IDQgMjJxMSA5IC0zIDIzcS00IDAgLTQgNnEtNiA0IC02IDE1cTYgNiAzIDIwcS0zIDEgLTE0IDFxLTEgMyAtNy41IDR0LTE2LjUgMGwtMTAgLTFxLTEgLTIgLTQuNSAtMS41IHQtOC41IDIuNXQtNSAzcS0zIDAgLTcuNSA0LjV0LTQuNSA4LjVxLTQgMSAtOCA5LjV0LTQgMTIuNXEtNCA0IDAgOXEwIDMgLTMgMTJxMCAyIDEuNSA0dDEuNSA0cTAgMTEgNCAxOXEwIDEgMiA0dDIgNHEyIDMgMyAzcTIgMSAzIDNxMiAxIDUgNXEyIDMgMyA0cTMgMSAwIDRxNCAwIDQgMTBxMiAzIDYgM2wxIDFxNCA1IDUgNXEyIDMgNiAzcTEgLTEgMi41IC0xdDQuNSAxbDMgMXE1IDcgMTQgN3ExIDIgNSAxLjV0MTAuNSAtMS41dDcuNSAtMXYyIHEzIC0xIDcgLTEwdDQgLTEyaDhxMCAtNCAxMCAtNHExNiAwIDE2IDZxNiAwIDYgLTZoNnQ4LjUgLTAuNXQ3LjUgLTJ0MiAtMi41cTIgMCA0IC0zdDMgLTNxMCAtMyAyLjUgLTguNXQ0LjUgLTUuNXEwIC04IDUgLTExcTYgLTE0IDEyIC0xOHEtMSAtMiAxLjUgLTZ0Mi41IC01cTEgLTYgMyAtN3EwIC00IDUgLTExLjV0OCAtNy41cTAgLTEgLTEgLTJ0MiAtMnpNMzEyIDI5NnEwIC0zIDMgMHEwIC00IC00IC0ycS0yIDAgLTEgM3ExIDAgMiAtMXogTTMyOCAyOTdxNCAtMSA3LjUgLTMuNXQ1LjUgLTIuNXEzIC0zIDMuNSAtNHQtMS41IC0ycS04IC0yIC0xMiA1cS01IDAgLTEwIDVxNiAwIDcgMnpNMzYyIDI4M2wyIC0xcTIgLTIgMyAtNGwxIC0xaC0xM3EtMSAtMSAtNC41IC0xdC00LjUgMmg3bC0yIDRxMSAwIDUgLTF0NiAtMXYzek0zMzEgMjc4cTQgMCA0IC0zcS01IDAgLTQgM3pNMzM2IDI3NWwyIDNxMSAwIDEgLTJxLTEgLTEgLTMgLTF6TTM3NiAyNzhxMyAwIDMgLTFxLTQgMiAtMyAxeiBNMzczIDI3OGwyIC0xcS0xIDAgLTEgLTAuNXQtMSAtMC41djJ6TTM1NyAyNTBxMSAxIDEgMmwxIC0xcTAgLTEgLTIgLTF6TTc0MCAxMzRxMCAyIDIgM3oiIC8+CjxnbHlwaCB1bmljb2RlPSJIIiBob3Jpei1hZHYteD0iODY1IiBkPSJNNjg2IDI3OXYtMzc4aC0xNzd2MjM1aC0xNTJ2LTIzNWgtMTgzdjM3OGgtMTUzbDQxMiA0MTFsNDExIC00MTFoLTE1OHoiIC8+CjxnbHlwaCB1bmljb2RlPSJJIiBob3Jpei1hZHYteD0iOTMyIiBkPSJNODg0IDIzNHYtMzE0aC04MzZ2MzE0bDE1NyA0MThoNTIyek01ODIgMjM0aDE5OGwtMTA1IDMyMmwtNDE4IDFsLTEwNCAtMzIzaDE5N2w0OSAtOTZoMTMweiIgLz4KPGdseXBoIHVuaWNvZGU9IkoiIGhvcml6LWFkdi14PSI4NjIiIGQ9Ik04NDggNTM0bC0xMjIgLTEyMmw4MiAtODJsLTM3MCAtNDJsNDMgMzY5bDgxIC04MWwxMjIgMTIyek0xMzYgMTQ4bC04MiA4MmwzNjkgNDNsLTQzIC0zNzBsLTgxIDgybC0xMjIgLTEyMmwtMTYzIDE2M3pNMTgyIDM4OGwxOTcgLTY4bC0yMjEgMTh6TTM5MyA0MTd2LTg1bC0yOCA4MHpNNjgyIDE3NGwtMTk3IDY5bDIyMSAtMTl6TTQ3MSAxNDZ2ODVsMjggLTgxeiIgLz4KPGdseXBoIHVuaWNvZGU9IksiIGhvcml6LWFkdi14PSI4NjkiIGQ9Ik01MzAgMzUxbDMxOCAtMzE4di0xNjh2MGgtMTY4aC0xdjEyOWgtMTI4djEyOGgtMTI4bC02MSA2MXEtNDAgLTE0IC04MyAtMTRxLTEwOSAwIC0xODcgNzcuNXQtNzggMTg3LjV0NzggMTg3LjV0MTg3IDc3LjV0MTg3IC03Ny41dDc4IC0xODcuNXEwIC00MyAtMTQgLTgzek0yMjQgNDAycTM3IDAgNjMgMjZ0MjYgNjN0LTI2IDYzdC02MyAyNnQtNjMuNSAtMjZ0LTI2LjUgLTYzdDI2LjUgLTYzdDYzLjUgLTI2eiIgLz4KPGdseXBoIHVuaWNvZGU9IkwiIGQ9Ik00NjAgNzAxcTE3NCAwIDI5NyAtMTIzdDEyMyAtMjk3dC0xMjMgLTI5N3QtMjk3IC0xMjN0LTI5NyAxMjN0LTEyMyAyOTd0MTIzIDI5N3QyOTcgMTIzek00NjAgLTM0cTEzMCAwIDIyMi41IDkydDkyLjUgMjIzdC05Mi41IDIyM3QtMjIyLjUgOTJ0LTIyMi41IC05MnQtOTIuNSAtMjIzdDkyLjUgLTIyM3QyMjIuNSAtOTJ6TTQ2NCA1MjlxMTAzIDAgMTc2LjUgLTczLjV0NzMuNSAtMTc3LjV0LTczIC0xNzcuNXQtMTc3IC03My41IHQtMTc3LjUgNzMuNXQtNzMuNSAxNzcuNXQ3My41IDE3Ny41dDE3Ny41IDczLjV6TTM5NiAzNTlxMzMgMzMgMTAyIDcwbC0zMCA0MHEtNCAxIC0xMiAxcS02MSAwIC0xMTYuNSAtNTV0LTU1LjUgLTExNnEwIC02IDEgLTlsNDIgLTMycTM4IDcwIDY5IDEwMXpNNTQwIDE1NXExNiAwIDI4IDEydDEyIDI5dC0xMS41IDI5dC0yOC41IDEydC0yOSAtMTJ0LTEyIC0yOXQxMiAtMjl0MjkgLTEyeiIgLz4KPGdseXBoIHVuaWNvZGU9Ik0iIGhvcml6LWFkdi14PSI5NTIiIGQ9Ik04OTIgMzJsLTI3MyAyNjJsMjczIDIzNHEzIC04IDMgLTE1di00NjVxMCAtOCAtMyAtMTZ6TTQ3NiAyMzhsLTcyIDU4bC0zNiAzMGwtMjc1IDIzNXExMCAyIDE0IDJoNzM4cTQgMCAxNCAtMmwtMjc1IC0yMzVsLTM2IC0zMHpNODQ1IC0yaC03MzhxLTUgMCAtMTMgMmwyNzYgMjY1bDEwNiAtODdsMTA3IDg3bDI3NSAtMjY1cS04IC0yIC0xMyAtMnpNNjAgNTI4bDI3MyAtMjM0bC0yNzMgLTI2MnEtMyA4IC0zIDE2djQ2NXEwIDcgMyAxNXoiIC8+CjxnbHlwaCB1bmljb2RlPSJOIiBob3Jpei1hZHYteD0iOTQzIiBkPSJNODU3IDY3MHExNyAwIDIzIC02dDYgLTIzdi02NTVxMCAtMTcgLTYgLTIzdC0yMyAtNmgtMTA4aC01NDZoLTcxcS0yOCAwIC01My41IDI2LjV0LTI1LjUgNTIuNXY0ODFxMCAxNyA2IDIzdDIzIDZoOTJ2OTVxMCAxNyA2IDIzdDIzIDZoNjU0ek04MzcgN3Y2MTNoLTYxNHYtNzR2LTUwdi00NDVoLTQ5djQ0NWgtNzF2LTQ2MHEwIC03IDExIC0xOHQxOCAtMTFoNzFoNTQ2aDg4ek01MTEgNTU2di0yMjNoLTIyM3YyMjNoMjIzek03NjUgNTI1di0zNyBoLTE4NXYzN2gxODV6TTc2NSA0MTF2LTM3aC0xODV2MzdoMTg1ek03NjUgMjU5di0zN2gtNDc3djM3aDQ3N3pNNzY1IDE0NHYtMzdoLTQ3N3YzN2g0Nzd6IiAvPgo8Z2x5cGggdW5pY29kZT0iTyIgaG9yaXotYWR2LXg9IjkzMCIgZD0iTTg4MiA1MTB2LTUxMWgtNzB2NTExaDcwek02OTUgNTEwaDQ3di01MTFoLTU1NnY1MTFoNTJxNjggMTMzIDEyMiAxMzNoMjA3cTMyIDAgNjYuNSAtNDAuNXQ2MS41IC05Mi41ek01MTQgNTIycTEzIDAgMjIgOXQ5IDIydC05IDIxLjV0LTIyIDguNWgtMTA0cS0xMyAwIC0yMS41IC04LjV0LTguNSAtMjEuNXQ4LjUgLTIydDIxLjUgLTloMTA0ek00OCA1MTBoNjl2LTUxMWgtNjl2NTExeiIgLz4KPGdseXBoIHVuaWNvZGU9IlAiIGhvcml6LWFkdi14PSI5MDkiIGQ9Ik03MTkgNDk2aDE0M3YtNDk1aC02NTl2MWwtMTc3IDQ2MWw2MTUgMjM3ek02NjAgNDk2bC01MSAxMzNsLTM0NSAtMTMzaDM5NnpNOTcgNDMybDEwNiAtMjc3djMxOHpNMjU4IDU2aDU0OXYzODVoLTU0OXYtMzg1ek02OTkgMjkybDU4IC0xOTBoLTQzMmwxMDMgMTEybDY2IC00MmwxMjMgMTc3bDM4IC03MXpNMzc5IDI3NXEtMjIgMCAtMzcgMTV0LTE1IDM3dDE1IDM3dDM3IDE1dDM3IC0xNXQxNSAtMzd0LTE1IC0zN3QtMzcgLTE1eiIgLz4KPGdseXBoIHVuaWNvZGU9IlEiIGhvcml6LWFkdi14PSI4NDQiIGQ9Ik02ODEgNTIxcTYxIC01NCA5NS41IC0xMjkuNXQzNC41IC0xNjAuNXEwIC0xNjEgLTExNCAtMjc1LjV0LTI3NSAtMTE0LjV0LTI3NSAxMTQuNXQtMTE0IDI3NS41cTAgODUgMzUgMTYxdDk2IDEzMHEyMCAxNyA0Ni41IDE1LjV0NDMuNSAtMjEuNXExNyAtMTkgMTUuNSAtNDUuNXQtMjEuNSAtNDMuNXEtODggLTc4IC04OCAtMTk2cTAgLTEwOSA3Ni41IC0xODZ0MTg1LjUgLTc3dDE4NS41IDc3dDc3LjUgMTg2cTAgMTE3IC04OCAxOTUgcS0yMCAxOCAtMjEuNSA0NHQxNi41IDQ2cTE3IDE5IDQzLjUgMjAuNXQ0NS41IC0xNS41ek00MjMgMTY2cS0yNiAwIC00NC41IDE5dC0xOC41IDQ1djQwN3EwIDI2IDE4LjUgNDV0NDQuNSAxOXQ0NSAtMTl0MTkgLTQ1di00MDdxMCAtMjYgLTE5IC00NXQtNDUgLTE5eiIgLz4KPGdseXBoIHVuaWNvZGU9IlIiIGhvcml6LWFkdi14PSI5MDkiIGQ9Ik02NjggMTA1djg3bDEwNCA3MHYtMjYyaC03MzF2NTIzaDMyN3EtMiAtMSAtNi41IC0zdC02LjUgLTNxLTg3IC0zOSAtMTQxIC05OWgtNjl2LTMxM2g1MjN6TTg3NyA0MTdsLTMxMyAtMjExdjEzN3EtOTAgMCAtMTQxIC03cS00OSAtNiAtODkuNSAtMjF0LTYzLjUgLTMzLjV0LTM5IC0zNS41dC0yMiAtMjhsLTYgLTEycTAgNTQgMjAgMTAwdDUxLjUgNzUuNXQ3MC41IDUyLjV0NzcuNSAzNXQ3MCAyMHQ1MS41IDEwbDIwIDJ2MTI2eiIgLz4KPGdseXBoIHVuaWNvZGU9IlMiIGhvcml6LWFkdi14PSI4NTMiIGQ9Ik04MjYgMzg5cTEwIC0xMSA4IC0yNHEwIC0xMyAtMTAgLTI4cS0zIC00IC0xNiAtMTRsLTE4NCAtMTIxcS0yIC0xIC01LjUgLTd0LTIuNSAtMTB2LTRsODEgLTIzN3E0IC0xMSA0IC0yM3EwIC0xNSAtNyAtMjVxLTExIC0xNiAtMzAgLTE2aC0xcS0xNiAxIC0zNiAxNWwtMTkwIDE1NXEtMyAzIC0xMCAzdC05IC0zbC0xODEgLTE1NHEtMTggLTE0IC0zNiAtMTVxLTIxIC0yIC0zMSAxNXEtOCAxMSAtOCAyNnEwIDcgNCAyMWw3MiAyMzZ2NCBxMSA1IC0yIDExdC02IDdsLTE4NSAxMjJxLTEwIDcgLTE2IDE0cS0xMSAxMyAtMTEgMjhxMCAxNCA4IDI0cTkgOSAxNiAxMnExMiA1IDI3IDVoMjMwcTYgMCAxMSA0cTcgNSA3IDEwbDY3IDIzOXE0IDE0IDkgMjFxMTMgMTggMzMgMTlxMjAgLTEgMzMgLTE5cTMgLTQgMTAgLTIxbDY2IC0yMzlxMCAtNSA3IC0xMHE1IC00IDExIC00aDIzMHE5IDAgMjAgLTNxMTQgLTQgMjMgLTE0eiIgLz4KPGdseXBoIHVuaWNvZGU9IlQiIGhvcml6LWFkdi14PSI4OTkiIGQ9Ik04MTcgMTg1bDYzIC02NGwtMTYyIC05MWwtOTIgLTE2M2wtNjMgNjRsMTQgMTQ4bC0xNjkgMTY5bC0yMjQgLTM3MWwtNjMgNjNsMTIwIDQ3NWwtMTc2IDE3NXEtMTkgMjAgLTE5IDQ2LjV0MTkgNDUuNXQ0NiAxOXQ0NiAtMTlsMTc2IC0xNzVsNDc1IDEyMGw2MyAtNjNsLTM3MSAtMjI1bDE2OCAtMTY4eiIgLz4KPGdseXBoIHVuaWNvZGU9IlUiIGhvcml6LWFkdi14PSI4OTQiIGQ9Ik03NjAgMTU0cTQ2IC0yMCA3Mi41IC00NC41dDI5LjUgLTM4LjVsMyAtMTR2LTg2aC04MzZ2ODZxMCAyIDAuNSA2dDYgMTV0MTUuNSAyMnQzMS41IDI2dDUwLjUgMjhxMTIgNSA1NCAyOXQ4NyA0M3Q5NCAyOHEtMzMgMzQgLTcyIDEzNHEtMTEgMjggLTExIDEwMHEwIDcgLTEgMzF0LTAuNSA0MS41dDMuNSAyOS41cTMxIDExMSAxNTkgMTExcTEyNyAwIDE1OCAtMTExcTQgLTEyIDQuNSAtMjkuNXQtMSAtNDF0LTEuNSAtMzEuNSBxMCAtNzIgLTEwIC0xMDBxLTM4IC05NiAtNzIgLTEzNHE1MCAtOCA5NC41IC0yN3Q4NyAtNDMuNXQ1NC41IC0yOS41eiIgLz4KPGdseXBoIHVuaWNvZGU9IlYiIGhvcml6LWFkdi14PSI5NDkiIGQ9Ik02NTkgNDE2bDIzNSAxMTF2LTQ0OWwtMjM1IDExMXYxdi0xMDNxMCAtMTkgLTEzIC0zMnQtMzIgLTEzaC01MTBxLTE5IDAgLTMyIDEzdC0xMyAzMnY0MzNxMCAxOSAxMyAzMnQzMiAxM2g1MTBxMTkgMCAzMiAtMTN0MTMgLTMydi0xMDR6IiAvPgo8Z2x5cGggdW5pY29kZT0iVyIgaG9yaXotYWR2LXg9Ijk1NCIgZD0iTTcwNCA1NHYxODFsOTIgOTN2LTI3NHEwIC01MSAtMzYgLTg3dC04NyAtMzZoLTQ5MnEtNTEgMCAtODcgMzZ0LTM2IDg3djQ5M3EwIDUxIDM2IDg3dDg3IDM2aDQ5MnExNyAwIDI0IC0ybC04OSAtOTBoLTQyN3EtMTMgMCAtMjIgLTl0LTkgLTIydi00OTNxMCAtMTMgOSAtMjJ0MjIgLTloNDkycTEzIDAgMjIgOXQ5IDIyek00MzEgMzE0bDM1NCAzNTRsMTMyIC0xMzJsLTM1NCAtMzU0djBsLTE5NSAtNjNsNjMgMTk1djB6TTU0NyAyMDggbC04OSA4OWwtNDMgLTEzMXoiIC8+CjxnbHlwaCB1bmljb2RlPSJYIiBob3Jpei1hZHYteD0iOTIxIiBkPSJNODY4IDU0MnYtNDIzaC02NnEtMTMgMjkgLTQwIDQ2LjV0LTYwIDE3LjV0LTU5LjUgLTE3LjV0LTQwLjUgLTQ2LjVoLTIyMHY0MjNoNDg2ek0yNDAgMTgzcS0zMyAwIC02MCAtMTcuNXQtNDAgLTQ2LjVoLTEwN3YxODBsMTExIDEyM2gxODR2LTI4NHEtMzMgNDUgLTg4IDQ1ek0xMDEgMjg4di01OGgxNjF2MTMyaC05OXpNMjQwIDE0NnEzMCAwIDUxLjUgLTIxdDIxLjUgLTUycTAgLTMwIC0yMS41IC01MS41dC01MS41IC0yMS41IHEtMzEgMCAtNTIgMjEuNXQtMjEgNTEuNXEwIDMxIDIxIDUydDUyIDIxek03MDIgMTQ2cTMxIDAgNTIgLTIxdDIxIC01MnEwIC0zMCAtMjEgLTUxLjV0LTUyIC0yMS41cS0zMCAwIC01MS41IDIxLjV0LTIxLjUgNTEuNXEwIDMxIDIxLjUgNTJ0NTEuNSAyMXoiIC8+CjxnbHlwaCB1bmljb2RlPSJZIiBob3Jpei1hZHYteD0iODYxIiBkPSJNNDI1IDQ4OGwtMTQ1IC00MDlsLTEyNiAxOTNsLTgxIC03NmwtMjIgLTIwbC00NiAzOWwxNjIgMTUxbDk2IC0xNDdsMTcxIDQ4M2wxNTcgLTYwNWwxMzEgNDEzbDExNiAtMzcxbC02MSAtMTZsLTU1IDE3OGwtMTM3IC00MzF6IiAvPgo8Z2x5cGggdW5pY29kZT0iWiIgaG9yaXotYWR2LXg9Ijg5NyIgZD0iTTQwMiA2MDd2LTM2OWgzNzFxMCAtMTUzIC0xMDggLTI2MXQtMjYxIC0xMDh0LTI2MSAxMDh0LTEwOCAyNjFxMCAxNTIgMTA3LjUgMjYwdDI1OS41IDEwOXpNNDk2IDcwMHExNTMgMCAyNjEuNSAtMTA4LjV0MTA4LjUgLTI2MS41aC0zNzF2MzcwaDF6IiAvPgo8Z2x5cGggdW5pY29kZT0iWyIgaG9yaXotYWR2LXg9Ijg2MSIgZD0iTTQ0NSA2NzF2LTI3OGg0MDl2LTE4NWgtNDA5di0yNzdsLTQyNyAzNzB6IiAvPgo8Z2x5cGggdW5pY29kZT0iXCIgaG9yaXotYWR2LXg9Ijg1NCIgZD0iTTcxMCA1NzloODd2LTczOWgtNzQwdjczOWg4OXY0NnEwIDM1IDIwIDU0dDU2IDE5dDU2LjUgLTE5LjV0MjAuNSAtNTMuNXYtNDZoNTJ2NDZxMCAzNCAyMC41IDUzLjV0NTYuNSAxOS41dDU2IC0xOXQyMCAtNTR2LTQ2aDUydjQ2cTAgMzQgMjAuNSA1My41dDU2LjUgMTkuNXQ1Ni41IC0xOS41dDIwLjUgLTUzLjV2LTQ2ek01OTggNjI1di0xMjNxMCAtMzIgMzUgLTMycTE5IDAgMjcuNSA3LjV0OC41IDI0LjV2MTIzcTAgMTcgLTguNSAyNC41IHQtMjcuNSA3LjVxLTM1IDAgLTM1IC0zMnpNMzkyIDYyNXYtMTIzcTAgLTE3IDguNSAtMjQuNXQyNy41IC03LjVxMzUgMCAzNSAzMnYxMjNxMCAzMiAtMzUgMzJxLTE5IDAgLTI3LjUgLTcuNXQtOC41IC0yNC41ek0xODcgNjI1di0xMjNxMCAtMzIgMzUgLTMycTE5IDAgMjcuNSA3LjV0OC41IDI0LjV2MTIzcTAgMTcgLTguNSAyNC41dC0yNy41IDcuNXEtMzUgMCAtMzUgLTMyek03MzUgLTk5djUxNGgtNjE2di01MTRoNjE2ek00MjkgOTkgcTAgLTQ1IC0zNSAtNzB0LTkwIC0yNXEtMzYgMCAtNzMgMTRsNyA1MnEzNSAtMTQgNzMgLTE0cTI0IDAgMzggMTF0MTQgMjhxMCAyMiAtMTYuNSAzMi41dC01OS41IDEyLjV2NTJxNjMgNSA2MyAzOHEwIDI4IC00MiAyOHEtMjkgMCAtNjEgLTE1bC03IDUycTM0IDE1IDg0IDE1cTQ1IDAgNzEgLTE4dDI2IC00NnEwIC01MCAtNjUgLTcydi0xcTczIC0yMCA3MyAtNzR6TTUzNyAyMjlsLTUyIC0yMGwtNyA1Mmw5MSA0NGgzMXYtMjk2aC02M3YyMjB6ICIgLz4KPGdseXBoIHVuaWNvZGU9Il0iIGhvcml6LWFkdi14PSI4NjEiIGQ9Ik00MTUgLTY5djI3N2gtNDA4djE4NWg0MDh2Mjc4bDQyOCAtMzcweiIgLz4KPGdseXBoIHVuaWNvZGU9Il4iIGhvcml6LWFkdi14PSI3NzUiIGQ9Ik03NDkgNTcycTIyIC00NiAtMyAtMTMycS0yNCAtODUgLTUgLTIzNHEtOCAtMiAtMjEgLTR0LTQ5IC04dC02NiAtOHQtNjEgLTJ0LTQ2LjUgOXQtMTAuNSAyNnExNSA0OCAtNDggNDZxLTYxIC0yIC0xODIgLTQ4cS0zNyAtMTQgLTYzIC0zdjM5OXEyMiA2IDU4IDE1dDExMiAyNXQxMjYuNSAxNC41dDUwLjUgLTI0LjVxMCAtMyAtMiAtMTQuNXQtMy41IC0yM3QtMS41IC0yM3Q1IC0xOHQxNiAtNS41cTMwIDQgNzguNSA3dDgyLjUgNHogTTE0NSA2NTh2LTgxN2gtODV2ODE3cTAgMTcgMTIuNSAyOS41dDMwLjUgMTIuNXExNyAwIDI5LjUgLTEyLjV0MTIuNSAtMjkuNXoiIC8+CjxnbHlwaCB1bmljb2RlPSJfIiBob3Jpei1hZHYteD0iODIwIiBkPSJNNTkgMTk4djE5OWg3MDJ2LTE5OWgtNzAyeiIgLz4KPGdseXBoIHVuaWNvZGU9ImAiIGhvcml6LWFkdi14PSI5MzYiIGQ9Ik0zMDYgMzc4bC0xNTIgMTUzbC05NSAtOTZ2Mjc3aDI3N2wtOTUgLTk1bDE1MiAtMTUyek03ODMgNzVsOTUgOTV2LTI3NmgtMjc3bDk1IDk1bC0xNTIgMTUxbDg3IDg3ek02MzEgMzc4bC04NyA4N2wxNTIgMTUybC05NSA5NWgyNzZ2LTI3N2wtOTQgOTV6TTMwNiAyMjdsODcgLTg3bC0xNTIgLTE1Mmw5NSAtOTVsLTI3NyAxdjI3N2w5NSAtOTZ6IiAvPgo8Z2x5cGggdW5pY29kZT0iYSIgaG9yaXotYWR2LXg9IjgxMCIgZD0iTTc0NSAxNDRxMjEgMCAzNS41IC0xNC41dDE0LjUgLTM1LjV0LTE0LjUgLTM2dC0zNS41IC0xNXEtMiAwIC02IDAuNXQtNiAwLjVxLTQyIC0zNiAtNzkgLTU5cS04MyAtNTUgLTE1NyAtNzZxLTcxIC00NCAtOTAgLTQ0cS0xNCAwIC05NSA0NXEtNzYgMjIgLTE1NiA3NXEtNDAgMjcgLTc5IDU5cS0yIDAgLTUuNSAtMC41dC01LjUgLTAuNXEtMjEgMCAtMzYgMTV0LTE1IDM2dDE1IDM1LjV0MzYgMTQuNXQzNS41IC0xNC41dDE0LjUgLTM1LjV2LTggcTkgLTggMzQgLTIydDM4IC0yM3E0NyAtMzEgMTQ0IC0zM2wzMiAxNTFxNCA5OCA3IDE5MmgtMTM2bC01MiAxMnEtMTQgLTE3IC0zMyAtMTdxLTE3IDAgLTI5IDExLjV0LTEyIDI4LjV0MTIgMjguNXQyOSAxMS41cTIyIDAgMzMgLTE4aDE5MHEyIDcyIDMgOTZxLTMyIDEwIC01MiAzNi41dC0yMCA2MC41cTAgNDIgMjkuNSA3MS41dDcwLjUgMjkuNXE0MiAwIDcxLjUgLTI5LjV0MjkuNSAtNzEuNXEwIC0zMyAtMjAgLTU5LjV0LTUxIC0zNi41IHEwIC03IDEuNSAtNDAuNWwyLjUgLTU2LjVoMTg5cTExIDE4IDMzIDE4cTE3IDAgMjkgLTExLjV0MTIgLTI4LjV0LTEyIC0yOC41dC0yOSAtMTEuNXEtMjEgMCAtMzIgMTdsLTUzIC0xMmgtMTM1bDYgLTE5MmwzMyAtMTU0cTc5IC00IDEyMCAyMXE1MCAzMCA5NiA2MnEtMSAyIC0xIDZxMCAyMSAxNSAzNS41dDM2IDE0LjV6TTM1MSA2MDFxMCAtMjIgMTUuNSAtMzcuNXQzNy41IC0xNS41cTIzIDAgMzguNSAxNS41dDE1LjUgMzcuNXQtMTYgMzcuNSB0LTM4IDE1LjV0LTM3LjUgLTE1LjV0LTE1LjUgLTM3LjV6IiAvPgo8Z2x5cGggdW5pY29kZT0iYiIgaG9yaXotYWR2LXg9IjkxOSIgZD0iTTQ2MSA2OTlsNDA4IC0xMTN2LTU5MWwtNDA4IC0xMTRsLTQxMCAxMTR2NTkxek00MjYgLTM4djQzOWwtMzA2IDg2di00NDF6TTQ2MCA0NjJsMzAwIDg0bC0yOTkgODJsLTMwMCAtODJ6TTgwMSA0NnY0NDBsLTMwNyAtODV2LTQ0MHoiIC8+CjxnbHlwaCB1bmljb2RlPSJjIiBob3Jpei1hZHYteD0iOTA4IiBkPSJNNzY3IDMxOHE0NiAtMTkgNzMuNSAtNjB0MjcuNSAtOTJxMCAtNjggLTQ4IC0xMTZ0LTExNiAtNDhoLTloLTE5OHYxNjJoMzBoNzZxMTIgMCAxNSA2LjV0LTQgMTYuNWwtMTQ1IDE3M3EtOCAxMCAtMTkuNSAxMHQtMTkuNSAtMTBsLTE0NSAtMTczcS04IC0xMCAtNSAtMTYuNXQxNiAtNi41aDc2aDMwdi0xNjJoLTE5OGgtMWgtMWgtMnYxcS02OCAxIC0xMTYuNSA1MHQtNDguNSAxMTdxMCA0NiAyMiA4NHQ2MCA2MXEtNSAxOCAtNSAzNCBxMCA0NyAzMy41IDgwLjV0ODEuNSAzMy41cTM5IDAgNjkgLTI0cTMxIDY0IDkxIDEwM3QxMzMgMzlxMTAzIDAgMTc1LjUgLTcyLjV0NzIuNSAtMTc1LjVxMCAtMTAgLTEgLTE1eiIgLz4KPGdseXBoIHVuaWNvZGU9ImQiIGhvcml6LWFkdi14PSI5MTgiIGQ9Ik00NTkgNjk5cTE3NCAwIDI5Ni41IC0xMjN0MTIyLjUgLTI5NnEwIC0xNzQgLTEyMi41IC0yOTYuNXQtMjk2LjUgLTEyMi41cS0xNzMgMCAtMjk2IDEyMi41dC0xMjMgMjk2LjVxMCAxNzMgMTIzIDI5NnQyOTYgMTIzek03NzQgMjgwcTAgMTMwIC05Mi41IDIyMnQtMjIyLjUgOTJxLTEwMCAwIC0xODIgLTU4bDQzOCAtNDM4cTU5IDgxIDU5IDE4MnpNMTQ1IDI4MHEwIC0xMzAgOTIgLTIyMnQyMjIgLTkycTEwMyAwIDE4MyA1OGwtNDM4IDQzOSBxLTU5IC04MyAtNTkgLTE4M3oiIC8+CjxnbHlwaCB1bmljb2RlPSJlIiBob3Jpei1hZHYteD0iNTU2IiBkPSJNNTUwIDY5OWwtMTkzIC0zNDJoMTU4bC01MTAgLTQ3NmwyMzkgMzg2aC0xNjB6IiAvPgo8Z2x5cGggdW5pY29kZT0iZiIgaG9yaXotYWR2LXg9IjkxMiIgZD0iTTU2IDQxNXExNDkgMCAyNzUgLTczLjV0MjAwIC0xOTkuNXQ3NSAtMjc1aC0xNjBxLTIgMTYxIC0xMTUgMjc0cS0xMTQgMTE0IC0yNzUgMTE0djE2MHpNNTYgNzAwcTE2OSAwIDMyMi41IC02NnQyNjUuNSAtMTc3LjV0MTc4IC0yNjZ0NjcgLTMyMy41aC0xNjBxLTEgMTgzIC05MS41IDMzNy41dC0yNDUgMjQ0LjV0LTMzNi41IDkwdjE2MXpNMTY3IDkwcTQ2IDAgNzguNSAtMzIuNXQzMi41IC03OC41dC0zMi41IC03OC41dC03OC41IC0zMi41IHQtNzguNSAzMi41dC0zMi41IDc4LjV0MzIuNSA3OC41dDc4LjUgMzIuNXoiIC8+CjxnbHlwaCB1bmljb2RlPSJnIiBob3Jpei1hZHYteD0iODk0IiBkPSJNODY1IDM2di0zNWgtMTUxdjQ3djFxLTQgNDMgLTU1IDczcS0xMCAxNiAtMjIgNDdxLTUgMTEgLTUgNDBxMCAzNyAxIDQxcTEzIDQ0IDY0IDQ0dDY0IC00NHYtNDFxMCAtMzAgLTQgLTQwcS0xNSAtMzkgLTI5IC01NHEyMCAtNCAzOCAtMTEuNXQzNS41IC0xN3QyMS41IC0xMS41cTE5IC04IDI5LjUgLTE4dDExLjUgLTE1ek0xODAgNDl2LTF2LTQ3aC0xNTF2MzVxMCAyIDEgNnQxMS41IDE0dDI5LjUgMThxNSAyIDIxLjUgMTJ0MzQuNSAxNy41IHQzOCAxMS41cS0xNCAxNSAtMjkgNTRxLTQgMTAgLTQgNDBxMCAzNyAxIDQxcTExIDQ0IDYzIDQ0cTUxIDAgNjQgLTQ0cTEgLTQgMSAtNDFxMCAtMzAgLTQgLTQwcS0xNSAtMzYgLTI0IC00OHEtNTMgLTMyIC01MyAtNzJ6TTYyMCAxMDJxMjUgLTExIDM5LjUgLTI0LjV0MTYuNSAtMjEuNWwyIC04di00N2gtNDYydjQ3cTAgMyAxLjUgOC41dDE2IDE5LjV0NDAuNSAyNnE2IDMgMjkgMTZ0NDggMjMuNXQ1MiAxNS41cS0xOCAyMSAtMzkgNzQgcS02IDEzIC02IDU2cTAgNTMgMSA1NnExNyA2MSA4NyA2MXQ4OCAtNjFxMSAtMyAxIC01NnEwIC00MSAtNiAtNTZxLTIxIC01NCAtNDAgLTc0cTI4IC01IDUyLjUgLTE1dDQ5IC0yNHQyOS41IC0xNnoiIC8+CjxnbHlwaCB1bmljb2RlPSJoIiBob3Jpei1hZHYteD0iOTA2IiBkPSJNODQ4IDQyNXEyNSAtNjggMjUgLTE0NHQtMjUgLTE0NHEtMTAgLTI4IC00MCAtMjhxLTYgMCAtMTAgMWwtNyAycS01NSAtMTExIC0xNjkgLTE2OWwyIC03cTQgLTE2IC0zLjUgLTMwdC0yMi41IC0yMHEtNzIgLTI1IC0xNDQgLTI1cS03MyAwIC0xNDUgMjVxLTE1IDYgLTIyLjUgMjB0LTMuNSAzMGwyIDdxLTExMiA1NSAtMTcwIDE2OWwtNyAtMnEtMyAtMSAtMTAgLTFxLTI5IDAgLTM5IDI4cS0yNiA3MCAtMjYgMTQ0dDI2IDE0NCBxMTAgMjggMzkgMjhxMyAwIDExIC0ybDYgLTFxNTggMTE1IDE3MCAxNjlsLTIgN3EtNCAxNiAzLjUgMzB0MjIuNSAyMHE3MiAyNSAxNDQgMjVxNzUgMCAxNDUgLTI2cTE1IC01IDIyLjUgLTE5dDMuNSAtMzBsLTIgLTdxMTEzIC01NiAxNzAgLTE2OWw2IDFxOCAyIDExIDJxMjkgMCAzOSAtMjh6TTgwOCAxNTFxMjMgNjMgMjMgMTMwcTAgNjYgLTIyIDEzMGwtMTY2IC00MXEyMCAtNDIgMjAgLTg5dC0yMCAtODl6TTU4MyAtNzRsLTQwIDE2NSBxLTQyIC0yMCAtODkgLTIwdC05MCAyMGwtNDAgLTE2NXE2MSAtMjMgMTMwIC0yM3E2OCAwIDEyOSAyM3pNNTYxIDEyOXExMiAtNyAxNyAtMTZxMjQgMTcgNDQgNDNxLTExIDYgLTE3IDE4cS04IDE3IDAgMzZxMTYgMzIgMTYgNzFxMCAzOCAtMTYgNzFxLTggMTggMCAzNnE3IDEyIDE3IDE4cS0xOSAyNSAtNDQgNDNxLTcgLTEyIC0xNyAtMTZxLTggLTQgLTE4IC00cS0xMSAwIC0xOCA0cS0zMyAxNiAtNzIgMTZxLTM4IDAgLTcxIC0xNiBxLTcgLTQgLTE4IC00cS0xMCAwIC0xOCA0cS0xMiA3IC0xNyAxNnEtMjUgLTE4IC00NCAtNDNxMTEgLTYgMTcgLTE4cTggLTE4IDAgLTM2cS0xNyAtMzYgLTE3IC03MXEwIC0zNiAxNiAtNzFxOSAtMTkgMCAtMzZxLTQgLTExIC0xNiAtMThxMTYgLTIyIDQ0IC00NHE1IDEwIDE3IDE3cTggNCAxOCA0cTExIDAgMTggLTRxMzMgLTE2IDcyIC0xNnEzOCAwIDcxIDE2cTcgNCAxOCA0cTEwIDAgMTggLTR6TTc1IDI4MXEwIC02NCAyMyAtMTMwbDE2NSA0MSBxLTIwIDQ1IC0yMCA4OXEwIDQ1IDIxIDg5bC0xNjYgNDFxLTIzIC02NyAtMjMgLTEzMHpNNDUzIDY1OXEtNjggMCAtMTI5IC0yM2w0MCAtMTY1cTQzIDIwIDg5IDIwcTQ3IDAgOTAgLTIwbDQwIDE2NXEtNjEgMjMgLTEzMCAyM3oiIC8+CjxnbHlwaCB1bmljb2RlPSJpIiBkPSJNNDYwIDY5OXExNzQgMCAyOTcgLTEyM3QxMjMgLTI5N3QtMTIzIC0yOTd0LTI5NyAtMTIzcS0xNzMgMCAtMjk2LjUgMTIzdC0xMjMuNSAyOTd0MTIzLjUgMjk3dDI5Ni41IDEyM3pNNTE0IDU2OXEtMzEgLTEgLTQ5IC0yMnQtMTggLTQ1cTAgLTI1IDEzLjUgLTQwLjV0MzYuNSAtMTUuNWgxcTI5IDAgNDguNSAyMC41dDE5LjUgNDguNXEwIDIzIC0xMyAzN3EtMTUgMTcgLTM5IDE3ek01NjUgOThsMyAzbC0yIDRsLTE4IDM4bC01IC00IHEtMTQgLTE0IC0zNC41IC0yOHQtMjQuNSAtMTV2NXEwIDcgMyAyMGw0NiAxODhxNiAyNSA2IDU3cTAgMTggLTYgMzBxLTcgMTIgLTIyIDEycS0yNSAwIC03MS41IC0yOC41dC05MS41IC03MC41bC0zIC0zbDE2IC00NWw2IDRxMzUgMzEgNTUgMzlxMCAtNiAtMyAtMjFsLTQzIC0xODJxLTYgLTMwIC02IC02MHEwIC0yNSAxMCAtMzZxOSAtMTAgMjYgLTEwcTIzIDAgNzAuNSAyOXQ4OC41IDc0eiIgLz4KPGdseXBoIHVuaWNvZGU9ImoiIGhvcml6LWFkdi14PSI4NzciIGQ9Ik04MzUgMjMydi0xbDEgLTF2LTFxMTkgLTM1IDE5IC03OXEwIC0xOCAtNSAtNDNxLTEyIC00NiAtNDUgLTgwbC02NCAtNjNxLTUxIC01MSAtMTIzIC01MXQtMTIyIDUxbC03NyA3NmwtNDcgNDhsLTMzIDMzcS0zNyAzNyAtNDggOTFxLTIgMjAgLTIgMzFxMCAxNyAzIDM1bDMgMTJxNCAxNSAxNCAzNHYxcTEgMSAyLjUgNGwyLjUgNWwxIDJsMSAxcTEgMSAyLjUgMy41dDIuNSAzLjV2MWwyIDJxMSAxIDMgMy41dDMgMy41djFsMiAybDQgNHQ0IDUgbDI4IDI4bDQgLTVsNTcgLTU2cTAgLTEgMiAtM3QyIC0zdDEgLTMuNXQxIC0zLjVsLTI1IC0yNXEtMSAtMSAtMyAtMy41dC00IC00LjVxMCAtMSAtMSAtMnYtMXEtMiAtMiAtNCAtNnEtMSAwIC0xIC0xdC0xIC0ydC0xLjUgLTMuNXQtMC41IC0zLjVsLTEgLTF2LTJxLTQgLTkgLTQgLTIycTAgLTE1IDcgLTMycTQgLTggMTQgLTIwbDU3IC01N2w0MCAtMzlsNjAgLTYxcTIxIC0yMSA1MiAtMjFxMzIgMCA1MiAyMWw2NCA2NHExMiAxMiAxOCAyOSBxMyAxMSAzIDIzcTAgMTAgLTMgMjFxLTUgMTkgLTE4IDMxbC05OCA5OHExIDYgMSAxN3EwIDIxIC0zIDQwcS0xMiA2OCAtNTkgMTE2cTM5IC0xMiA3MSAtNDJsMiAtMmwxNTcgLTE1N3ExOCAtMTggMjkgLTM5cTAgLTEgMSAtMXpNNTM4IDQ0MXEzOSAtMzkgNDggLTkxcTMgLTE1IDMgLTMxcTAgLTExIC00IC0zNWwtMyAtMTJxLTMgLTEyIC0xMyAtMzRsLTEgLTFxLTEgLTEgLTIuNSAtNGwtMi41IC01bC0xIC0ybC0xIC0xcS0yIC00IC01IC03IGwtMSAtMXEtMSAtMSAtMSAtMnEtMyAtMyAtNSAtN2wtMSAtMWwtMiAtMnEtMiAtMyAtOCAtOWwtMjggLTI4bC00IDVsLTU3IDU2cS0xIDEgLTIgM3QtMiAzdC0xIDMuNXQtMSAzLjVsMjUgMjVxMSAxIDMgMy41dDQgNC41cTAgMSAwLjUgMXQwLjUgMXYxcTIgMiA0IDZsMSAxcTEgMSAxIDJxMiA0IDMgN3YxcTAgMSAxIDJxMyAxMSAzIDIycTAgMTUgLTcgMzJxLTQgOCAtMTQgMjBsLTU3IDU3bC0zOSAzOWwtNjEgNjFxLTIxIDIxIC01MiAyMSB0LTUyIC0yMWwtNjQgLTY0cS0xMiAtMTIgLTE4IC0yOXEtMyAtMTEgLTMgLTIzcTAgLTEwIDMgLTIxcTUgLTE5IDE4IC0zMWw5OCAtOThxLTEgLTYgLTEgLTE3cTAgLTIzIDQgLTQwcTEwIC02NSA1OCAtMTE2cS00MCAxMiAtNzEgNDJsLTIgMmwtMTU3IDE1N3EtMTggMTggLTI5IDM5cTAgMSAtMSAxdjFsLTEgMXYxcS0xOSAzOCAtMTkgNzlxMCAxOCA1IDQzcTEyIDQ2IDQ1IDgwbDY0IDYzcTUxIDUxIDEyMyA1MXQxMjIgLTUxbDc3IC03NiBsNDcgLTQ4eiIgLz4KPGdseXBoIHVuaWNvZGU9ImsiIGhvcml6LWFkdi14PSI4OTYiIGQ9Ik02NTcgNjEwcTg5IDAgMTQ4LjUgLTUwLjV0NTkuNSAtMTU5LjVxMCAtNDkgLTI2IC0xMDF0LTUyIC03OWwtMjYgLTI4bC0zMTMgLTMxMmwtMzEzIDMxMmwtMTEgMTF0LTI1IDMwdC0zMiA0NnQtMjUgNTYuNXQtMTEgNjQuNXEwIDEwOSA1OSAxNTkuNXQxNDggNTAuNXE5MCAwIDE5MSAtMTA3bDE5IC0yMXE0IDUgMTEuNSAxMy41dDMxIDMxdDQ3IDM5dDU2LjUgMzAuNXQ2MyAxNHoiIC8+CjxnbHlwaCB1bmljb2RlPSJsIiBob3Jpei1hZHYteD0iOTQyIiBkPSJNMjc5IDcwMGg2MDV2LTEzM2gtNjA1djEzM3pNMjc5IDI4NHYxMzNoNjA1di0xMzNoLTYwNXpNMjc5IDB2MTMzaDYwNXYtMTMzaC02MDV6TTEyMiA3MDBxMjggMCA0Ny41IC0xOS41dDE5LjUgLTQ2LjVxMCAtMjggLTE5LjUgLTQ3LjV0LTQ3LjUgLTE5LjVxLTI3IDAgLTQ2LjUgMTkuNXQtMTkuNSA0Ny41cTAgMjcgMTkuNSA0Ni41dDQ2LjUgMTkuNXpNMTIyIDQxOHEyOCAwIDQ3LjUgLTE5LjV0MTkuNSAtNDcuNXEwIC0yNyAtMTkuNSAtNDYuNSB0LTQ3LjUgLTE5LjVxLTI3IDAgLTQ2LjUgMTkuNXQtMTkuNSA0Ni41cTAgMjggMTkuNSA0Ny41dDQ2LjUgMTkuNXpNMTIyIDEzNHEyOCAwIDQ3LjUgLTE5LjV0MTkuNSAtNDYuNXEwIC0yOCAtMTkuNSAtNDcuNXQtNDcuNSAtMTkuNXEtMjcgMCAtNDYuNSAxOS41dC0xOS41IDQ3LjVxMCAyNyAxOS41IDQ2LjV0NDYuNSAxOS41eiIgLz4KPGdseXBoIHVuaWNvZGU9Im0iIGhvcml6LWFkdi14PSI4MDgiIGQ9Ik03NzEgNjk4di04M3YtNTE0cS0xIC01MiAtNDYuNSAtODh0LTExMC41IC0zNnQtMTExIDM3dC00NiA4OXQ0NiA4OXQxMTEgMzdxMzYgMCA3MCAtMTN2MzA4bC0zNTIgLTg0di00OTVxLTEgLTUyIC00NyAtODguNXQtMTEwIC0zNi41cS02NSAwIC0xMTEgMzd0LTQ2IDkwcTAgNTIgNDYgODl0MTExIDM3cTM1IDAgNjkgLTEzdjUxM2gybDQzOCAxMDR6IiAvPgo8Z2x5cGggdW5pY29kZT0ibiIgaG9yaXotYWR2LXg9Ijk1NiIgZD0iTTc1OSA3MDBxNTggMCA5OSAtNDF0NDEgLTk5di01NjFxMCAtNTggLTQxIC05OXQtOTkgLTQxaC01NjFxLTU4IDAgLTk5IDQxdC00MSA5OXY1NjFxMCA1OCA0MSA5OXQ5OSA0MWg1NjF6TTc5NCA0OTBoLTUxM3YtMTE3aDUxM3YxMTd6TTI1OSAyMTdoLTk2di0xMTRoOTZ2MTE0ek0xNjMgMjM4aDk2djExNGgtOTZ2LTExNHpNMjgxIDIxN3YtMTE0aDUxM3YxMTRoLTUxM3pNMjgxIDIzOGg1MTN2MTE0aC01MTN2LTExNHpNMjU5IDQ5MGgtOTYgdi0xMTdoOTZ2MTE3ek0xNjMgLTFxMCAtMTQgMTAuNSAtMjQuNXQyNC41IC0xMC41aDYxdjExN2gtOTZ2LTgyek03NTkgLTM2cTE0IDAgMjQuNSAxMC41dDEwLjUgMjQuNXY4MmgtNTEzdi0xMTdoNDc4eiIgLz4KPGdseXBoIHVuaWNvZGU9Im8iIGhvcml6LWFkdi14PSI5NDEiIGQ9Ik04NjcgNTQ1cTExIDAgMTggLTcuNXQ3IC0xNy41di01MjVxMCAtMTEgLTcgLTE4dC0xOCAtN2gtNzg0cS0xMSAwIC0xOCA3dC03IDE4djUyNXEwIDEwIDcgMTcuNXQxOCA3LjVoMzhsMjkgNTlxMTEgMjIgMzYgMjJoMTU4cTI1IDAgMzYgLTIybDI4IC01OWg0NTl6IiAvPgo8Z2x5cGggdW5pY29kZT0icCIgaG9yaXotYWR2LXg9Ijg1NSIgZD0iTTU0MiA1NDlsMTUzIC0xNTNsLTQ2MCAtNDYwdjB2MGwtMjI2IC03NGw3MyAyMjd2MHYwek0xODggNjVsMzc5IDM3OWwtMjUgMjZsLTM4MCAtMzgwek02OTQgNzAxbDE1NCAtMTUzbC0xMDEgLTEwMGwtMTUzIDE1M3oiIC8+CjxnbHlwaCB1bmljb2RlPSJxIiBob3Jpei1hZHYteD0iOTEwIiBkPSJNODY1IDE2MHEwIC00MiAtMjYgLTc1dC02NiAtNDRxMTUgLTQzIDY2IC04MnExMiAtOCAtOSAtMTRxLTQ1IC0xMSAtMTE0IDIxcS01MiAyNSAtOTcgNzFoLTI5OXEtNDIgMCAtNzcgMjdxMzAgMTggNTYgNDNoMjc2cTc0IDAgMTI2LjUgNTIuNXQ1Mi41IDEyNi41djIzNXE0NyAtNSA3OSAtNDB0MzIgLTgzdi0yMzh6TTY5OCAyODZxMCAtNTIgLTM2IC04OHQtODcgLTM2aC0yOThxLTQ5IC01MCAtMTAwIC03MnQtOTAgLTIycS0zNCAwIC0zNCAxMSBxMCAzIDMgNXE1MCAzOCA2NiA4MnEtNDAgMTEgLTY2IDQ0dC0yNiA3NnYyMzdxMCA1MSAzNiA4Ny41dDg4IDM2LjVoNDIxcTUxIDAgODcgLTM2LjV0MzYgLTg3LjV2LTIzN3oiIC8+CjxnbHlwaCB1bmljb2RlPSJyIiBob3Jpei1hZHYteD0iOTAwIiBkPSJNNzI2IDI3OGwyNCAyNGw5MSA5MXYtMjYwcTAgLTEyOCAtMTI4IC0xMjhoLTUwOXYtMTA4bC0xNzEgMTcybDE3MSAxNzJ2LTExNXYtNmg0ODRxMTYgMCAyNyAxMXQxMSAyN3YxMjB6TTE3NCAzMTlsLTI0IC0yNGwtOTEgLTkxdjI2MHEwIDEyNyAxMjggMTI3aDUwOXYxMDhsMTcxIC0xNzFsLTE3MSAtMTcydjExNXY2aC00ODRxLTE2IDAgLTI3IC0xMS41dC0xMSAtMjcuNXYtMTE5eiIgLz4KPGdseXBoIHVuaWNvZGU9InMiIGhvcml6LWFkdi14PSI4NjQiIGQ9Ik04MTYgNHEyMyAtMjMgMjMgLTU0cTAgLTI5IC0yMCAtNDhxLTE5IC0xOSAtNDcgLTE5cS0zMiAwIC01NSAyM2wtMjE5IDIxOXEtNzQgLTQ4IC0xNjYgLTQ4cS0xMjkgMCAtMjIwLjUgOTEuNXQtOTEuNSAyMjAuNXQ5MS41IDIyMC41dDIyMC41IDkxLjV0MjIwLjUgLTkxLjV0OTEuNSAtMjIwLjVxMCAtOTAgLTQ3IC0xNjV6TTUwNiAzODlxMCA3MiAtNTEgMTIzdC0xMjMgNTF0LTEyMyAtNTF0LTUxIC0xMjN0NTEgLTEyM3QxMjMgLTUxIHQxMjMgNTF0NTEgMTIzeiIgLz4KPGdseXBoIHVuaWNvZGU9InQiIGhvcml6LWFkdi14PSI5MTkiIGQ9Ik00NjAgNjk5cTE3MyAwIDI5NiAtMTIzdDEyMyAtMjk2cTAgLTE3NCAtMTIzIC0yOTd0LTI5NiAtMTIzcS0xNzQgMCAtMjk3IDEyM3QtMTIzIDI5N3EwIDE3MyAxMjMgMjk2dDI5NyAxMjN6TTQ2MCAtMzVxMTMwIDAgMjIyIDkyLjV0OTIgMjIyLjV0LTkyIDIyMnQtMjIyIDkydC0yMjIuNSAtOTJ0LTkyLjUgLTIyMnQ5Mi41IC0yMjIuNXQyMjIuNSAtOTIuNXpNNjYzIDE4NnExNCAtMTAgNSAtMjRsLTI0IC0zOXEtNSAtNiAtMTEgLThoLTQgcS01IDAgLTEwIDNsLTE5MyAxMjlxLTEgMSAtMi41IDJ0LTIuNSAxcS01IDcgLTUgMTN2MjI4cTAgNyA1IDEycTcgNSAxMyA1aDQ2cTcgMCAxMiAtNXQ1IC0xMnYtMTkzeiIgLz4KPGdseXBoIHVuaWNvZGU9InUiIGhvcml6LWFkdi14PSI5NTUiIGQ9Ik02MCA2MzFoODM1di02NzNoLTgzNXY2NzN6TTgyNSAyOHY1MzRoLTY5NXYtNTM0aDY5NXpNMjI1IDQzMXEtMTggMCAtMzEgMTN0LTEzIDMxdDEzIDMwLjV0MzEgMTIuNXQzMC41IC0xMi41dDEyLjUgLTMwLjV0LTEyLjUgLTMxdC0zMC41IC0xM3pNNzMxIDQzMXEtMTggMCAtMzEgMTN0LTEzIDMxdDEzIDMwLjV0MzEgMTIuNXQzMC41IC0xMi41dDEyLjUgLTMwLjV0LTEyLjUgLTMxdC0zMC41IC0xM3pNMjI1IDE1OXExOCAwIDMwLjUgLTEzIHQxMi41IC0zMXQtMTIuNSAtMzAuNXQtMzAuNSAtMTIuNXQtMzEgMTIuNXQtMTMgMzAuNXQxMyAzMXQzMSAxM3pNNzMxIDE1OXExOCAwIDMwLjUgLTEzdDEyLjUgLTMxdC0xMi41IC0zMC41dC0zMC41IC0xMi41dC0zMSAxMi41dC0xMyAzMC41dDEzIDMxdDMxIDEzek01OTMgNDU3di0zMjVoLTIyOHYzMjVoMjI4ek01MzMgMTgxdjExOGgtMTA5di0xMThoMTA5eiIgLz4KPGdseXBoIHVuaWNvZGU9InYiIGhvcml6LWFkdi14PSI5NDUiIGQ9Ik04NjYgNTU3cTEwIDAgMTcuNSAtN3Q3LjUgLTE3di00NzJxMCAtMTEgLTcuNSAtMTh0LTE3LjUgLTdoLTc4NnEtMTAgMCAtMTcuNSA3dC03LjUgMTh2NDcycTAgMTAgNy41IDE3dDE3LjUgN2gxNzNxMCAxIDEgMWwyMyA0OHE0IDkgMTUgMTUuNXQyMSA2LjVoMzE5cTI1IDAgMzYgLTIybDI0IC00OHYtMWgxNzR6TTQ3MiAxMjBxNzUgMCAxMjggNTIuNXQ1MyAxMjcuNXQtNTMgMTI4dC0xMjggNTNxLTc0IDAgLTEyNyAtNTN0LTUzIC0xMjggdDUzIC0xMjcuNXQxMjcgLTUyLjV6IiAvPgo8Z2x5cGggdW5pY29kZT0idyIgaG9yaXotYWR2LXg9IjkyNyIgZD0iTTg4NSAzOTdxMTYgLTEzNyAtOTQuNSAtMjQ3dC0yODIuNSAtMTI5cS02MiAtNyAtMTIwIDBxLTkyIC05NSAtMTk3IC0xMDZxLTQ3IC01IC01NiA4cS0zIDQgMyA4cTg4IDY2IDgwIDE0NXEtNjkgMzkgLTExMiA5OHQtNTEgMTMwcS0xNiAxMzYgOTQgMjQ2LjV0MjgyIDEzMC41cTE3MiAxOSAzMDQuNSAtNjR0MTQ5LjUgLTIyMHoiIC8+CjxnbHlwaCB1bmljb2RlPSJ4IiBob3Jpei1hZHYteD0iOTQ5IiBkPSJNNTI2IDEwMHEyIDEwIDIgMTZsOTggOThsMTM5IC0xMzlsOTQgLTY5bDEwIC0zOGwtMTA0IC0xMDRsLTM3IDEwbC03MCA5NHpNNzU1IDIycS0xOCAwIC0zMC41IC0xMi41dC0xMi41IC0zMS41cTAgLTE4IDEyLjUgLTMwLjV0MzAuNSAtMTIuNXExOSAwIDMxLjUgMTIuNXQxMi41IDMwLjVxMCAxOSAtMTIuNSAzMS41dC0zMS41IDEyLjV6TTQ2OSAzNzFsLTk4IC05OHEtNiAwIC0xNiAtMmwtNzEgNzBxLTMyIC0xNSAtNTYgLTE1IHEtNzQgMCAtMTMzLjUgNjB0LTYwLjUgMTM0cTAgMSAxNyAxOHE2MyAtNjMgNzEgLTY4dDQ1IC01cTI5IDAgNjUuNSAzNnQzNi41IDY2cTAgMzYgLTYgNDUuNXQtNjcgNjkuNXExNSAxOCAxOCAxOHE3NCAxIDEzNCAtNTkuNXQ2MCAtMTM0LjVxMCAtMjcgLTE2IC01N3pNNzg2IDIwMnEwIDMgMC41IDcuNXQwLjUgMTguNXQtMS41IDI4dC01LjUgMzJ0LTEwLjUgMzMuNXQtMTkgMzAuNXQtMjguNSAyNGgtM3EtMTAgMCAtMzQgLTIybC0yMTggLTIxNyBxOCAtMjkgLTggLTQ3cS0yIC0xIC03IC02bC0yMDEgLTIwMXEtNSAtNSAtNiAtN3EtMTEgLTExIC0yOSAtMTFxLTQxIDAgLTc3IDQ4dC04IDc3cTMgMiA2IDZsMjAyIDIwMnE1IDMgNiA2cTExIDExIDI4IDExcTkgMCAxOSAtM2wxOTQgMTk0bDQgNnE0IDYgNS41IDh0NSA4LjV0NC41IDExdDEuNSAxMXQtMSAxMy41dC00LjUgMTRxLTE2IDI5IC02MCAzOGgtMXEtMTYgMCAtNTUgMzdsLTYgNnEtMTkgMTkgLTIwIDI1dDE4IDI3bDcyIDczIHExNyAxNyAyNiAxN3E2IDAgMjYgLTIwbDYgLTZxMzMgLTMzIDM3IC00OXE0IC0yMCAyNCAtNDZxMyAtNCAxOCAtNHQxOSAtNGwxMTkgLTExOXE3MyAtNzMgMzAgLTI1MmwtMTUgLTUweiIgLz4KPGdseXBoIHVuaWNvZGU9InkiIGhvcml6LWFkdi14PSI4OTciIGQ9Ik04NDMgMzU5cTkgLTEgMTUuNSAtOXQ2LjUgLTE3di05N3EwIC05IC02LjUgLTE3dC0xNS41IC05bC0xMjQgLTIzcS05IC0yIC0xMiAtOHQyIC0xNGw3MiAtMTA2cTEyIC0xOSAtNCAtMzVsLTY4IC02OHEtMTYgLTE2IC0zNCAtM2wtMTA2IDcxcS03IDUgLTE0LjUgMi41dC04LjUgLTExLjVsLTIzIC0xMjVxLTEgLTkgLTkgLTE1LjV0LTE3IC02LjVoLTk3cS05IDAgLTE3IDYuNXQtOSAxNS41bC0yMyAxMjVxLTEgOSAtOC41IDExLjUgdC0xNC41IC0yLjVsLTEwNSAtNzFxLTIwIC0xMiAtMzUgM2wtNjggNjhxLTE2IDE2IC00IDM1bDcyIDEwNnE1IDggMiAxNHQtMTIgOGwtMTI0IDIzcS05IDEgLTE1LjUgOXQtNi41IDE3djk3cTAgOSA2LjUgMTd0MTUuNSA5bDEyNCAyM3EyMiA2IDEwIDIzbC03MiAxMDZxLTExIDE5IDQgMzRsNjggNjhxMTYgMTYgMzUgNGwxMDUgLTcycTcgLTUgMTQuNSAtMnQ4LjUgMTJsMjMgMTI0cTEgOSA5IDE1LjV0MTcgNi41aDk3cTkgMCAxNyAtNi41IHQ5IC0xNS41bDIzIC0xMjRxMSAtOSA4LjUgLTEydDE0LjUgMmwxMDYgNzJxMTggMTIgMzQgLTRsNjggLTY4cTE1IC0xNSA0IC0zNGwtNzIgLTEwNnEtMTIgLTE3IDEwIC0yM3pNNDQ4IDEzNHE2MyAwIDEwNyA0NHQ0NCAxMDZ0LTQ0IDEwNi41dC0xMDcgNDQuNXEtNjIgMCAtMTA2IC00NC41dC00NCAtMTA2LjV0NDQgLTEwNnQxMDYgLTQ0eiIgLz4KPGdseXBoIHVuaWNvZGU9InoiIGhvcml6LWFkdi14PSI3MzYiIGQ9Ik00MzMgLTMzcTM0IDAgNTUgMjNsMTc2IDE3NmwzOSAtMzlxMTUgLTE1IDAgLTMxbC0yNTQgLTI1NHEtMTUgLTE2IC0zMSAwbC0zNTAgMzUwcS0xNSAxNSAtMTcgMzZsLTggOTdsMzM1IC0zMzVxMjMgLTIzIDU1IC0yM3pNMzUzIDY2NGwzNTAgLTM0OXExNiAtMTYgMCAtMzFsLTI1NCAtMjU1cS03IC02IC0xNiAtNnQtMTUgNmwtMzUwIDM1MHEtMTUgMTcgLTE3IDM3bC0xNyAxOTBxLTIgMjIgMTQgMzZsNDMgNDRxMTUgMTMgMzQgMTNoMyBsMTg5IC0xN3EyMiAtMiAzNiAtMTh6TTExNSA2MTdxLTE0IC0xMyAtMTQgLTMzdDE0IC0zM3ExMyAtMTMgMzMgLTEzdDMzIDEzdDEzIDMzdC0xMyAzM3EtMTQgMTQgLTMzIDE0dC0zMyAtMTR6IiAvPgo8Z2x5cGggdW5pY29kZT0ieyIgaG9yaXotYWR2LXg9Ijc2MiIgZD0iTTc1MSAyOTloLTI3OHYtNDA4aC0xODV2NDA4aC0yNzdsMzcwIDQyOHoiIC8+CjxnbHlwaCB1bmljb2RlPSJ8IiBob3Jpei1hZHYteD0iOTE1IiBkPSJNMTgyIDI4MHEtMyAtMTYgLTMgLTM1di02OXEtNTggMCAtOTguNSA0MC41dC00MC41IDk4LjV2MjQ0cTAgNTggNDAuNSA5OC41dDk4LjUgNDAuNWgzNDhxNTggMCA5OC41IC00MC41dDQwLjUgLTk4LjV2LTEwNWgtMTA0djEwNXEwIDE0IC0xMC41IDI0LjV0LTI0LjUgMTAuNWgtMzQ4cS0xNCAwIC0yNC41IC0xMC41dC0xMC41IC0yNC41di0yNDRxMCAtMTQgMTAuNSAtMjQuNXQyNC41IC0xMC41aDN6TTczNiAzODVxNTcgMCA5OCAtNDEgdDQxIC05OXYtMjQzcTAgLTU4IC00MSAtOTl0LTk4IC00MWgtMzQ4cS01OCAwIC05OC41IDQxdC00MC41IDk5djI0M3EwIDU4IDQwLjUgOTl0OTguNSA0MWgzNDh6TTc3MCAydjI0M3EwIDE1IC0xMCAyNXQtMjQgMTBoLTM0OHEtMTQgMCAtMjQuNSAtMTB0LTEwLjUgLTI1di0yNDNxMCAtMTUgMTAuNSAtMjV0MjQuNSAtMTBoMzQ4cTE0IDAgMjQgMTB0MTAgMjV6IiAvPgo8Z2x5cGggdW5pY29kZT0ifSIgaG9yaXotYWR2LXg9Ijc2MiIgZD0iTTExIDMwMWgyNzd2NDA5aDE4NXYtNDA5aDI3OGwtMzcwIC00Mjd6IiAvPgo8Z2x5cGggdW5pY29kZT0ifiIgZD0iTTQ2MCA2OTlxMTc0IDAgMjk3IC0xMjN0MTIzIC0yOTd0LTEyMyAtMjk3dC0yOTcgLTEyM3QtMjk3IDEyM3QtMTIzIDI5N3QxMjMgMjk3dDI5NyAxMjN6TTYyOCAzNHYyMzJoLTE2NmwxNDUgMTY3aC0xMTJ2MTM1aC03NXYtMTM1aC0xMTJsMTQ0IC0xNjdoLTE2MnYtMjMyaDE0NWwtMzkgLTM5aDEyNmwtMzkgMzloMTQ1ek0zMzMgNzZ2MTQ4aDI1M3YtMTQ4aC0yNTN6IiAvPgo8Z2x5cGggdW5pY29kZT0iJiN4ZmY7IiBob3Jpei1hZHYteD0iODMzIiAvPgo8Z2x5cGggaG9yaXotYWR2LXg9IjUwMCIgLz4KPC9mb250Pgo8L2RlZnM+PC9zdmc+IA==') format('svg')
}

.x-tab .x-button-icon:before,
.x-button .x-button-icon:before {
	font-family: "Pictos"
}

.x-img.x-img-image {
	text-align: center
}

.x-img.x-img-image img {
	width: auto;
	height: 100%
}

.x-img.x-img-background {
	background-repeat: no-repeat;
	background-position: center;
	background-size: auto 100%
}

.x-map {
	background-color: #edeae2
}

.x-map * {
	-webkit-box-sizing: content-box;
	box-sizing: content-box
}

.x-mask-map {
	background: transparent !important
}

.x-map-container {
	position: absolute !important;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0
}

.x-mask {
	min-width: 8.5em;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	height: 100%;
	z-index: 10;
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.3) center center no-repeat
}

.x-mask.x-mask-gray {
	background-color: rgba(0, 0, 0, 0.5)
}

.x-mask.x-mask-transparent {
	background-color: transparent
}

.x-mask .x-mask-inner {
	position: relative;
	background: rgba(0, 0, 0, 0.25);
	color: #fff;
	text-align: center;
	padding: .4em;
	font-size: .95em;
	font-weight: bold
}

.x-mask .x-loading-spinner-outer {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 100%;
	min-width: 8em;
	height: 8em
}

.x-mask.x-indicator-hidden .x-mask-inner {
	padding-bottom: 0 !important
}

.x-mask.x-indicator-hidden .x-loading-spinner-outer {
	display: none
}

.x-mask.x-indicator-hidden .x-mask-message {
	position: relative;
	bottom: .25em
}

.x-mask .x-mask-message {
	position: absolute;
	bottom: 5px;
	color: #333;
	left: 0;
	right: 0;
	-webkit-box-flex: 0;
	-ms-flex: 0 0 auto;
	flex: 0 0 auto
}

.x-mask.x-has-message .x-mask-inner {
	padding-bottom: 2em
}

.x-mask.x-has-message .x-loading-spinner-outer {
	height: 168px
}

.x-ie .x-mask[visibility='visible']~div:not(.x-mask) .x-input-el,
.x-ie .x-mask[visibility='visible']~div:not(.x-panel) .x-input-el,
.x-ie .x-mask[visibility='visible']~div:not(.x-floating) .x-input-el,
.x-ie .x-mask[visibility='visible']~div:not(.x-center) .x-input-el,
.x-ie .x-mask[visibility='visible']~div:not(.x-msgbox) .x-input-el,
.x-ie .x-mask:not(.x-item-hidden)~div:not(.x-mask) .x-input-el,
.x-ie .x-mask:not(.x-item-hidden)~div:not(.x-panel) .x-input-el,
.x-ie .x-mask:not(.x-item-hidden)~div:not(.x-floating) .x-input-el,
.x-ie .x-mask:not(.x-item-hidden)~div:not(.x-center) .x-input-el,
.x-ie .x-mask:not(.x-item-hidden)~div:not(.x-msgbox) .x-input-el {
	visibility: collapse
}

.x-video {
	height: 100%;
	width: 100%;
	background-color: #000
}

.x-video>* {
	height: 100%;
	width: 100%;
	position: absolute
}

.x-video-ghost {
	-webkit-background-size: 100% auto;
	background: #000 url() center center no-repeat
}

audio {
	width: 100%
}

.x-msgbox {
	min-width: 15em;
	max-width: 20em;
	max-height: 90%;
	margin: 6px;
	border: 1px solid #ccc
}

.x-msgbox .x-docking-vertical {
	overflow: hidden
}

.x-msgbox .x-toolbar.x-docked-top {
	border-bottom: 0
}

.x-msgbox .x-toolbar.x-docked-bottom {
	border-top: 0
}

.x-ie .x-msgbox .x-dock.x-dock-horizontal.x-unsized>.x-dock-body {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 0px;
	flex: 1 0 0px
}

.x-msgbox-text {
	text-align: center
}

.x-msgbox-buttons .x-button {
	min-width: 4.5em
}

.x-progressindicator {
	width: 50%;
	height: 1.3em
}

.x-progressindicator .x-progressindicator-inner {
	background: #222222;
	padding: 10px;
	height: 100%;
	border-radius: 20px;
	box-shadow: 0px 5px 17px rgba(40, 40, 40, 0.5);
	box-sizing: content-box;
	position: relative
}

.x-progressindicator .x-progressindicator-text {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	left: 0px;
	color: white;
	text-shadow: 1px 1px 2px black
}

.x-progressindicator .x-progressindicator-bar {
	height: 100%;
	width: 0%;
	border-radius: 10px
}

.x-progressindicator:not(.x-item-hidden) .x-progressindicator-bar .x-progressindicator-bar-fill {
	height: 100%;
	width: 100%;
	background-color: gray;
	border-radius: 10px;
	-webkit-animation-name: progressIndicator;
	-moz-animation-name: progressIndicator;
	-ms-animation-name: progressIndicator;
	-o-animation-name: progressIndicator;
	animation-name: progressIndicator;
	-webkit-animation-duration: 1s;
	-moz-animation-duration: 1s;
	-ms-animation-duration: 1s;
	-o-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-timing-function: linear;
	-moz-animation-timing-function: linear;
	-ms-animation-timing-function: linear;
	-o-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-iteration-count: infinite;
	-moz-animation-iteration-count: infinite;
	-ms-animation-iteration-count: infinite;
	-o-animation-iteration-count: infinite;
	animation-iteration-count: infinite;
	background-repeat: repeat-x;
	background-size: 30px 30px;
	background-image: -webkit-linear-gradient(-45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	background-image: -moz-linear-gradient(-45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	background-image: -o-linear-gradient(-45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
	background-image: -ms-linear-gradient(-45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent)
}

@-webkit-keyframes progressIndicator {
	to {
		background-position: 30px
	}
}

@-moz-keyframes progressIndicator {
	to {
		background-position: 30px
	}
}

@keyframes progressIndicator {
	to {
		background-position: 30px
	}
}

.x-panel,
.x-msgbox {
	position: relative
}

.x-panel.x-floating,
.x-msgbox,
.x-form.x-floating {
	padding: 6px;
	background-color: #ccc
}

.x-panel.x-floating .x-panel-inner,
.x-panel.x-floating>.x-body,
.x-msgbox .x-panel-inner,
.x-msgbox>.x-body,
.x-form.x-floating .x-panel-inner,
.x-form.x-floating>.x-body {
	z-index: 1;
	background-color: #fff
}

.x-panel.x-floating>.x-dock,
.x-msgbox>.x-dock,
.x-form.x-floating>.x-dock {
	z-index: 1
}

.x-panel.x-floating>.x-dock.x-sized,
.x-msgbox>.x-dock.x-sized,
.x-form.x-floating>.x-dock.x-sized {
	margin: 6px
}

.x-sheet,
.x-sheet-action {
	height: auto
}

.x-toolbar {
	position: relative;
	background-color: #eee;
	min-height: 2.6em;
	overflow: hidden
}

.x-toolbar.x-docked-top {
	border-bottom: 1px solid
}

.x-toolbar.x-docked-bottom {
	border-top: 1px solid
}

.x-toolbar.x-docked-left {
	width: 50px;
	height: auto;
	border-right: 1px solid
}

.x-toolbar.x-docked-right {
	width: 50px;
	height: auto;
	border-left: 1px solid
}

.x-title {
	font-size: 1.2em;
	text-align: center;
	font-weight: bold;
	max-width: 100%
}

.x-title.x-title-align-left {
	padding-left: 10px
}

.x-title.x-title-align-right {
	padding-right: 10px
}

.x-title .x-innerhtml {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.x-navigation-bar .x-container {
	overflow: visible
}

.x-toolbar-inner .x-field .x-component-outer {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto
}

.x-ie .x-toolbar-inner {
	height: 100% !important
}

.x-toast {
	min-width: 15em;
	max-width: 20em;
	max-height: 90%;
	margin: 6px
}

.x-toast .x-toast-text {
	text-align: center
}

.x-ie .x-toast .x-dock.x-dock-horizontal.x-unsized>.x-dock-body {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 0px;
	flex: 1 0 0px
}

.x-menu {
	background: #eee
}

.x-carousel-inner {
	position: relative;
	overflow: hidden
}

.x-carousel-item,
.x-carousel-item>* {
	position: absolute !important;
	width: 100%;
	height: 100%
}

.x-carousel-indicator {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto;
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center
}

.x-carousel-indicator span {
	display: block;
	width: 10px;
	height: 10px;
	margin: 3px;
	background-color: #eee
}

.x-carousel-indicator span.x-carousel-indicator-active {
	background-color: #ccc
}

.x-carousel-indicator-horizontal {
	width: 100%
}

.x-carousel-indicator-vertical {
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column;
	height: 100%
}

.x-android-3 .x-surface-wrap,
.x-android-3 .x-surface-wrap>* {
	-webkit-perspective: 1
}

.x-draw-component {
	position: relative
}

.x-draw-component .x-inner {
	overflow: hidden
}

.x-surface {
	position: absolute
}

.x-chart-watermark {
	opacity: 0.5;
	z-index: 9;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	padding: 4px 6px;
	font-family: "Helvetica";
	font-size: 12px;
	position: absolute;
	border-top-left-radius: 4px;
	white-space: nowrap;
	-webkit-border-top-left-radius: 4px
}

.x-legend .x-legend-inner .x-legend-container {
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	-ms-border-radius: 5px;
	-o-border-radius: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	background: #fff
}

.x-legend .x-legend-inner .x-legend-container .x-legend-item {
	padding: 0.8em 1em 0.8em 1.8em;
	color: #333;
	background: rgba(255, 255, 255, 0);
	max-width: 20em;
	min-width: 0;
	font-size: 14px;
	line-height: 14px;
	font-weight: bold;
	white-space: nowrap;
	position: relative
}

.x-legend .x-legend-inner .x-legend-container .x-legend-item .x-legend-inactive {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=30);
	opacity: 0.3
}

.x-legend .x-legend-inner .x-legend-container .x-legend-item .x-legend-item-marker {
	position: absolute;
	width: 0.8em;
	height: 0.8em;
	-webkit-border-radius: 0.4em;
	-moz-border-radius: 0.4em;
	-ms-border-radius: 0.4em;
	-o-border-radius: 0.4em;
	border-radius: 0.4em;
	-webkit-box-shadow: rgba(255, 255, 255, 0.3) 0 1px 0, rgba(0, 0, 0, 0.4) 0 1px 0 inset;
	-moz-box-shadow: rgba(255, 255, 255, 0.3) 0 1px 0, rgba(0, 0, 0, 0.4) 0 1px 0 inset;
	box-shadow: rgba(255, 255, 255, 0.3) 0 1px 0, rgba(0, 0, 0, 0.4) 0 1px 0 inset;
	left: .7em;
	top: 1em
}

.x-legend.x-docked-top .x-legend-item,
.x-legend.x-docked-bottom .x-legend-item {
	border-right: 1px solid rgba(204, 204, 204, 0.5)
}

.x-legend.x-docked-top .x-legend-item:last-child,
.x-legend.x-docked-bottom .x-legend-item:last-child {
	border-right: 0
}

.x-legend.x-docked-left .x-legend-inner,
.x-legend.x-docked-right .x-legend-inner {
	display: -webkit-box;
	-webkit-box-align: center;
	-webkit-box-pack: center
}

.x-chart-toolbar {
	position: absolute;
	z-index: 9;
	display: -webkit-box;
	display: -moz-box;
	display: -ms-box;
	display: box;
	padding: .6em
}

.x-chart-toolbar .x-button {
	margin: .2em
}

.x-chart-toolbar[data-side=left],
.x-chart-toolbar[data-side=right] {
	top: 0;
	-webkit-box-orient: vertical;
	-moz-box-orient: vertical;
	-ms-box-orient: vertical;
	box-orient: vertical
}

.x-chart-toolbar[data-side=left] {
	left: 0
}

.x-chart-toolbar[data-side=right] {
	right: 0
}

.x-chart-toolbar[data-side=top],
.x-chart-toolbar[data-side=bottom] {
	-webkit-box-orient: horizontal;
	-moz-box-orient: horizontal;
	-ms-box-orient: horizontal;
	box-orient: horizontal;
	right: 0
}

.x-chart-toolbar[data-side=top] {
	top: 0
}

.x-chart-toolbar[data-side=bottom] {
	bottom: 0;
	-webkit-box-orient: horizontal;
	-moz-box-orient: horizontal;
	-ms-box-orient: horizontal;
	box-orient: horizontal
}

.x-tab .x-button-icon.list:before,
.x-button .x-button-icon.list:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "l"
}

.x-tab .x-button-icon.expand:before,
.x-button .x-button-icon.expand:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "`"
}

.x-dataview-inlineblock .x-dataview-item,
.x-dataview-inlineblock .x-data-item {
	display: inline-block !important
}

.x-dataview-nowrap .x-dataview-container {
	white-space: nowrap !important
}

.x-dataview-nowrap .x-container.x-dataview {
	white-space: nowrap !important
}

.x-list {
	overflow: hidden
}

.x-list .x-scroll-scroller {
	max-width: 100%
}

.x-list .x-list-inner {
	width: 100% !important
}

.x-list.x-list-indexed .x-list-disclosure {
	margin-right: 50px
}

.x-list .x-item-selected .x-list-disclosure {
	background-color: #fff
}

.x-list .x-list-scrolldock-hidden {
	display: none
}

.x-list .x-list-item {
	position: absolute !important;
	left: 0;
	top: 0;
	width: 100%
}

.x-list .x-list-item>.x-dock {
	height: auto
}

.x-list .x-list-item .x-dock-horizontal {
	border-top: 1px solid #ccc
}

.x-list .x-list-item.x-item-selected .x-dock-horizontal,
.x-list .x-list-item.x-item-selected.x-list-item-tpl {
	background-color: #ccc
}

.x-list .x-list-item.x-item-pressed.x-list-item-tpl,
.x-list .x-list-item.x-item-pressed .x-dock-horizontal {
	background-color: #ddd
}

.x-list .x-list-item .x-list-item-body,
.x-list .x-list-item.x-list-item-tpl .x-innerhtml {
	padding: 5px
}

.x-list .x-list-item.x-list-item-relative {
	position: relative !important
}

.x-list .x-list-header {
	background-color: #eee;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	font-weight: bold
}

.x-list .x-list-header.x-list-item-relative {
	position: relative !important
}

.x-list .x-list-disclosure {
	margin: 5px 15px 5px 0;
	overflow: visible;
	width: 20px;
	height: 20px;
	border: 1px solid #ccc;
	background-color: #eee
}

.x-list .x-list-item-tpl .x-list-disclosure {
	position: absolute;
	right: 0px;
	top: 0px
}

.x-list .x-list-emptytext {
	text-align: center;
	pointer-events: none;
	font-color: #333333;
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center
}

.x-list.x-list-indexed .x-list-disclosure {
	margin-right: 35px
}

.x-list .x-list-scrolldockitem {
	position: absolute !important;
	left: 0;
	top: 0;
	width: 100%
}

.x-ie .x-list-grouped .x-translatable-container .x-list-item:before,
.x-ie .x-list-grouped .x-translatable-container .x-list-header:before {
	content: ". .";
	color: transparent;
	position: absolute;
	left: 0px;
	word-spacing: 3000px;
	opacity: 0
}

.x-list-header {
	position: absolute;
	left: 0;
	width: 100%;
	z-index: 2 !important
}

.x-ios .x-list-header {
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	-o-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0)
}

.x-list-grouped .x-list-item.x-list-header-wrap .x-dock-horizontal,
.x-list-grouped .x-list-item-tpl.x-list-header-wrap {
	border-top: 0
}

.x-list-inlineblock .x-list-item {
	display: inline-block !important
}

.x-list-nowrap .x-list-inner {
	width: auto
}

.x-list-nowrap .x-list-container {
	white-space: nowrap !important
}

.x-list-item-dragging {
	border-bottom: 1px solid #ccc;
	background: #fff !important;
	z-index: 1
}

.x-indexbar-wrapper {
	-webkit-box-pack: end !important;
	-ms-flex-pack: end !important;
	justify-content: flex-end !important;
	pointer-events: none
}

.x-indexbar {
	pointer-events: auto;
	z-index: 2;
	min-height: 0 !important;
	height: auto !important;
	-webkit-box-flex: 0 !important;
	-ms-flex: 0 0 auto !important;
	flex: 0 0 auto !important
}

.x-indexbar>div {
	font-size: 0.6em;
	text-align: center;
	line-height: 1.1em;
	font-weight: bold;
	display: block
}

.x-indexbar-vertical {
	width: 15px;
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column;
	margin-right: 15px
}

.x-indexbar-horizontal {
	height: 15px;
	-webkit-box-orient: horizontal;
	-ms-flex-direction: row;
	flex-direction: row
}

.x-phone.x-landscape .x-indexbar>div {
	font-size: 0.38em;
	line-height: 1em
}

.x-indexbar-pressed {
	background-color: #ccc
}

.x-form-label {
	display: none !important
}

.x-form-label span {
	font-weight: bold
}

.x-form-label-nowrap .x-form-label {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.x-field {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox
}

.x-field .x-field-input {
	position: relative;
	min-width: 3.7em
}

.x-field .x-field-input,
.x-field .x-input-el {
	width: 100%
}

.x-field.x-field-labeled .x-form-label {
	display: block !important
}

.x-field .x-component-outer {
	position: relative
}

.x-label-align-left,
.x-label-align-right {
	-webkit-box-orient: horizontal !important;
	-ms-flex-direction: row !important;
	flex-direction: row !important
}

.x-label-align-left .x-component-outer,
.x-label-align-right .x-component-outer {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 0px;
	flex: 1 0 0px
}

.x-label-align-right {
	-webkit-box-direction: reverse;
	-ms-flex-direction: row-reverse;
	flex-direction: row-reverse
}

.x-label-align-top,
.x-label-align-bottom {
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column
}

.x-label-align-bottom {
	-webkit-box-direction: reverse;
	-ms-flex-direction: column-reverse;
	flex-direction: column-reverse
}

.x-input-el {
	display: block
}

.x-field-mask {
	width: auto;
	height: auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.x-ie .x-field.x-field-text .x-field-mask,
.x-ie .x-field.x-field-textarea .x-field-mask,
.x-ie .x-field.x-field-search .x-field-mask {
	z-index: -1
}

.x-field-required .x-form-label:after {
	content: "*";
	display: inline
}

.x-spinner .x-component-outer {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox
}

.x-spinner .x-component-outer>* {
	width: auto
}

.x-spinner .x-field-input {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 0px;
	flex: 1 0 0px
}

.x-spinner .x-field-input .x-input-el {
	width: 100%;
	text-align: center
}

.x-spinner .x-field-input input::-webkit-outer-spin-button,
.x-spinner .x-field-input input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0
}

.x-spinner .x-spinner-button {
	text-align: center;
	border: 1px solid #ccc !important;
	background-color: #eee
}

.x-spinner.x-field-grouped-buttons .x-input-el {
	text-align: left
}

.x-select-overlay .x-list-label {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: block
}

input[type="search"]::-webkit-search-cancel-button {
	-webkit-appearance: none
}

.x-field-number input::-webkit-outer-spin-button,
.x-field-number input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0
}

.x-field-input .x-clear-icon,
.x-field-input .x-reveal-icon {
	display: none;
	width: 10px;
	height: 10px;
	background-color: #ccc;
	position: absolute;
	top: 50%;
	right: 0
}

.x-field-clearable .x-clear-icon {
	display: block
}

.x-field-clearable .x-field-input {
	padding-right: 10px
}

.x-field-revealable .x-reveal-icon {
	display: block
}

.x-field-revealable .x-field-input {
	padding-right: 10px
}

.x-field-clearable.x-field-revealable .x-reveal-icon {
	right: 20px
}

.x-android .x-input-el {
	-webkit-text-fill-color: #000
}

.x-android .x-empty .x-input-el {
	-webkit-text-fill-color: #A9A9A9
}

.x-android .x-item-disabled .x-input-el {
	-webkit-text-fill-color: #b3b3b3
}

.x-form-fieldset .x-form-fieldset-inner {
	border: 1px solid #ccc;
	overflow: hidden
}

.x-form-fieldset .x-dock .x-dock-body {
	-webkit-box-flex: 1;
	-ms-flex: 1 0 auto;
	flex: 1 0 auto
}

.x-form-fieldset-title {
	font-weight: bold
}

.x-form-fieldset-title .x-innerhtml {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.x-form-fieldset-instructions {
	text-align: center
}

.x-ie .x-field-select .x-field-mask {
	z-index: 3
}

.x-sheet.x-picker {
	padding: 0
}

.x-sheet.x-picker .x-sheet-inner {
	background-color: #fff;
	overflow: hidden
}

.x-sheet.x-picker .x-sheet-inner .x-picker-slot .x-body {
	border-left: 1px solid #999999;
	border-right: 1px solid #ACACAC
}

.x-sheet.x-picker .x-sheet-inner .x-picker-slot.x-first .x-body {
	border-left: 0
}

.x-sheet.x-picker .x-sheet-inner .x-picker-slot.x-last .x-body {
	border-left: 0;
	border-right: 0
}

.x-picker-slot .x-scroll-view {
	z-index: 2;
	position: relative
}

.x-picker-mask {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 3;
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-align: stretch;
	-ms-flex-align: stretch;
	align-items: stretch;
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	pointer-events: none
}

.x-picker-slot-title {
	position: relative;
	z-index: 2
}

.x-picker-slot-title>div {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-weight: bold
}

.x-picker-slot .x-dataview-inner {
	width: 100% !important
}

.x-picker-slot .x-dataview-item {
	vertical-align: middle;
	height: 30px;
	line-height: 30px
}

.x-picker-slot .x-dataview-item.x-item-selected {
	font-weight: bold
}

.x-picker-slot .x-picker-item {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.x-ie .x-picker-item {
	cursor: default
}

.x-ie .x-picker-item::before {
	content: ". .";
	color: transparent;
	position: absolute;
	left: 0px;
	word-spacing: 3000px
}

.x-picker-right {
	text-align: right
}

.x-picker-center {
	text-align: center
}

.x-picker-left {
	text-align: left
}

.x-list-paging .x-loading-spinner {
	display: none;
	margin: auto
}

.x-list-paging .x-list-paging-msg {
	text-align: center;
	clear: both
}

.x-list-paging.x-loading .x-loading-spinner {
	display: block
}

.x-list-paging.x-loading .x-list-paging-msg {
	display: none
}

.x-list-pullrefresh {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	-webkit-box-orient: horizontal;
	-ms-flex-direction: row;
	flex-direction: row;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-direction: normal;
	-ms-flex-direction: row;
	flex-direction: row;
	position: absolute;
	top: -5em;
	left: 0;
	width: 100%;
	height: 4.5em
}

.x-list-pullrefresh .x-loading-spinner {
	display: none
}

.x-list-pullrefresh-arrow {
	width: 2.5em;
	height: 4.5em;
	background-color: #bbb
}

.x-list-pullrefresh-wrap {
	width: 20em;
	font-size: 0.7em
}

.x-list-pullrefresh-message {
	font-weight: bold;
	font-size: 1.3em;
	text-align: center
}

.x-list-pullrefresh-updated {
	text-align: center
}

.x-list-pullrefresh-loading *.x-loading-spinner {
	display: block
}

.x-list-pullrefresh-loading .x-list-pullrefresh-arrow {
	display: none
}

.x-android-2 .x-list-pullrefresh-loading *.x-loading-spinner {
	display: none
}

.x-slider,
.x-toggle {
	position: relative;
	height: 16px;
	min-height: 0;
	min-width: 0
}

.x-slider>*,
.x-toggle>* {
	position: absolute;
	width: 100%;
	height: 100%
}

.x-thumb {
	position: absolute;
	height: 16px;
	width: 10px;
	border: 1px solid #ccc;
	background-color: #ddd
}

.x-slider:before {
	content: '';
	position: absolute;
	width: auto;
	height: 8px;
	top: 4px;
	left: 0;
	right: 0;
	margin: 0 5px;
	background-color: #eee
}

.x-toggle {
	border: 1px solid #ccc;
	width: 30px;
	overflow: hidden;
	-webkit-box-flex: 0;
	-ms-flex: 0 0 auto;
	flex: 0 0 auto
}

.x-toggle-on {
	background-color: #eee
}

.x-tab {
	z-index: 1;
	overflow: visible !important;
	background-color: #eee;
	border: 1px solid #ccc
}

.x-tabbar {
	border-color: #ccc;
	border-style: solid;
	border-width: 0;
	background-color: #eee
}

.x-tabbar.x-docked-top {
	border-bottom-width: 1px
}

.x-tabbar.x-docked-top .x-tab .x-button-icon {
	position: relative
}

.x-tabbar.x-docked-top .x-tab .x-button-icon.x-shown {
	display: inline-block
}

.x-tabbar.x-docked-top .x-tab .x-button-icon.x-hidden {
	display: none
}

.x-tabbar.x-docked-bottom {
	border-top-width: 1px
}

.x-tabbar.x-docked-bottom .x-tab .x-button-icon {
	display: block;
	position: relative
}

.x-tabbar.x-docked-bottom .x-tab .x-button-icon.x-shown {
	visibility: visible
}

.x-tabbar.x-docked-bottom .x-tab .x-button-icon.x-hidden {
	visibility: hidden
}

.x-tab {
	position: relative;
	min-width: 3.3em
}

.x-table-inner {
	display: table !important;
	width: 100% !important;
	height: 100% !important
}

.x-table-inner.x-fixed-layout {
	table-layout: fixed !important
}

.x-table-row {
	display: table-row !important
}

.x-table-cell {
	display: table-cell !important;
	vertical-align: middle
}

.x-orientation-inspector {
	display: none;
	content: "landscape"
}

@media (orientation : portrait) {
	.x-orientation-inspector {
		content: "portrait"
	}
}

.x-grid .x-grid-header-container {
	border-width: 0 1px 1px 0;
	border-style: solid;
	height: 65px;
	font-weight: bold;
	overflow: hidden
}

.x-grid .x-grid-header-container .x-grid-column {
	display: inline-block
}

.x-grid .x-grid-header-container .x-grid-header-container-inner {
	width: 100000px;
	position: absolute;
	top: 0;
	left: 0
}

.x-grid .x-grid-column {
	height: 64px;
	border-width: 1px 1px 0 1px;
	border-style: solid;
	line-height: 64px;
	vertical-align: middle;
	padding: 0 8px
}

.x-grid .x-grid-column .x-innerhtml {
	display: inline-block;
	width: auto;
	position: relative
}

.x-grid .x-grid-column.x-column-sorted-asc .x-innerhtml:after,
.x-grid .x-grid-column.x-column-sorted-desc .x-innerhtml:after {
	position: absolute;
	width: 12px;
	line-height: 64px;
	top: 0;
	height: 64px;
	font-family: 'Pictos';
	font-size: 12px
}

.x-grid .x-grid-column.x-column-align-left .x-innerhtml:after,
.x-grid .x-grid-column.x-column-align-center .x-innerhtml:after {
	right: -16px
}

.x-grid .x-grid-column.x-column-align-right .x-innerhtml:after {
	left: -16px
}

.x-grid .x-grid-column.x-column-sorted-asc .x-innerhtml:after {
	content:"{"
}

.x-grid .x-grid-column.x-column-sorted-desc .x-innerhtml:after {
	content: "}"
}

.x-grid .x-grid-headergroup {
	display: inline-block;
	position: relative;
	vertical-align: bottom;
	height: 64px;
	padding-top: 32px
}

.x-grid .x-grid-headergroup .x-inner>.x-innerhtml {
	height: 32px;
	line-height: 28px;
	vertical-align: middle;
	display: block;
	position: absolute;
	width: 100%;
	top: 0;
	left: 0;
	text-align: center;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	text-overflow: ellipsis
}

.x-grid .x-grid-headergroup .x-grid-column {
	height: 32px !important;
	line-height: 27px !important;
	font-size: 0.7em
}

.x-grid .x-grid-headergroup .x-grid-column.x-column-sorted-asc .x-innerhtml:after,
.x-grid .x-grid-headergroup .x-grid-column.x-column-sorted-desc .x-innerhtml:after {
	line-height: 27px;
	height: 27px
}

.x-grid .x-grid-row {
	position: absolute;
	left: 0;
	top: 0;
	border-width: 0 0 1px 0;
	border-style: solid
}

.x-grid .x-grid-cell {
	display: inline-block;
	vertical-align: middle;
	line-height: 60px;
	padding: 0 8px;
	height: 60px;
	overflow: hidden;
	border-width: 0 1px 0 0
}

.x-grid .x-grid-cell-align-center,
.x-grid .x-grid-column-align-center {
	text-align: center
}

.x-grid .x-grid-cell-align-right,
.x-grid .x-grid-column-align-right {
	text-align: right
}

.x-grid .x-grid-viewoptions {
	border-width: 0 0 0 1px;
	border-style: solid
}

.x-grid .x-grid-viewoptions .x-list-item .x-innerhtml {
	padding: 0px !important
}

.x-grid .x-grid-viewoptions .x-column-options-header {
	height: 32px;
	line-height: 28px;
	vertical-align: middle;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	padding-left: 10px
}

.x-grid .x-grid-viewoptions .x-column-options-sortablehandle,
.x-grid .x-grid-viewoptions .x-column-options-visibleindicator,
.x-grid .x-grid-viewoptions .x-column-options-groupindicator,
.x-grid .x-grid-viewoptions .x-column-options-folder,
.x-grid .x-grid-viewoptions .x-column-options-leaf {
	width: 40px;
	height: 48px;
	position: absolute;
	bottom: 0
}

.x-grid .x-grid-viewoptions .x-column-options-sortablehandle:after,
.x-grid .x-grid-viewoptions .x-column-options-visibleindicator:after,
.x-grid .x-grid-viewoptions .x-column-options-groupindicator:after,
.x-grid .x-grid-viewoptions .x-column-options-folder:after,
.x-grid .x-grid-viewoptions .x-column-options-leaf:after {
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
	text-align: center;
	font-size: 24px;
	font-family: 'Pictos';
	line-height: 48px;
	content: "l";
	vertical-align: middle
}

.x-grid .x-grid-viewoptions .x-column-options-sortablehandle {
	left: 0
}

.x-grid .x-grid-viewoptions .x-column-options-sortablehandle:after {
	line-height: 54px
}

.x-grid .x-grid-viewoptions .x-column-options-visibleindicator {
	right: 0
}

.x-grid .x-grid-viewoptions .x-column-options-visibleindicator:after {
	font-size: 30px;
	line-height: 54px;
	content: "E"
}

.x-grid .x-grid-viewoptions .x-column-options-groupindicator {
	right: 40px
}

.x-grid .x-grid-viewoptions .x-column-options-groupindicator:after {
	font-size: 30px;
	line-height: 54px;
	content: "g"
}

.x-grid .x-grid-viewoptions .x-column-options-folder,
.x-grid .x-grid-viewoptions .x-column-options-leaf {
	width: 30px;
	left: 40px
}

.x-grid .x-grid-viewoptions .x-column-options-folder:after,
.x-grid .x-grid-viewoptions .x-column-options-leaf:after {
	line-height: 52px;
	content: "o"
}

.x-grid .x-grid-viewoptions .x-column-options-leaf:after {
	content: "F"
}

.x-grid .x-grid-viewoptions .x-list-item.x-item-selected.x-list-item-tpl {
	background: transparent
}

.x-grid .x-grid-viewoptions .x-list-item.x-item-selected.x-list-item-tpl .x-innerhtml {
	background: transparent
}

.x-grid .x-grid-viewoptions .x-column-options-text {
	display: block;
	height: 30px;
	margin: 10px 50px 5px 80px;
	position: relative;
	vertical-align: middle;
	line-height: 28px
}

.x-grid .x-grid-columnoptions {
	border-width: 0 0 1px
}

.x-grid .x-grid-multiselection-column {
	position: relative;
	padding: 0
}

.x-grid .x-grid-multiselection-column:after {
	position: absolute;
	top: 0;
	left: 0;
	width: 60px;
	height: 64px;
	line-height: 64px;
	font-family: 'Pictos';
	font-size: 26px;
	text-align: center;
	content: "2"
}

.x-grid .x-grid-multiselection-cell {
	position: relative;
	padding: 0
}

.x-grid .x-grid-multiselection-cell:after {
	position: absolute;
	top: 0;
	left: 0;
	width: 60px;
	height: 60px;
	line-height: 60px;
	font-family: 'Pictos';
	font-size: 20px;
	text-align: center;
	content: "_"
}

.x-grid .x-item-selected .x-grid-multiselection-cell:after {
	content: "3"
}

.x-grid .x-grid-pagingtoolbar>.x-body {
	padding: 0 30px 0 50px
}

.x-grid .x-grid-pagingtoolbar-currentpage {
	position: relative;
	height: 22px
}

.x-grid .x-grid-pagingtoolbar-currentpage span {
	position: absolute;
	right: 0;
	top: 0;
	line-height: 22px;
	height: 22px
}

.x-grid .x-grid-summaryrow {
	height: 32px;
	font-size: 0.8em;
	position: relative
}

.x-grid .x-grid-summaryrow .x-grid-cell {
	height: 32px;
	line-height: 30px;
	border-width: 0 0 1px;
	border-style: solid
}

.x-grid .x-grid-summaryrow .x-grid-multiselection-cell:after {
	content: ''
}

.x-ie .x-grid-grouped .x-translatable-container .x-grid-row:before,
.x-ie .x-grid-grouped .x-translatable-container .x-grid-header:before {
	content: ". .";
	color: transparent;
	position: absolute;
	left: 0px;
	word-spacing: 3000px;
	opacity: 0
}

.x-grid-header {
	line-height: 44px;
	font-weight: bold;
	position: absolute;
	left: 0;
	width: 100%;
	z-index: 2 !important
}

.x-ios .x-grid-header {
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	-o-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0)
}

.x-grid-grouped .x-grid-row.x-grid-header-wrap .x-dock-horizontal,
.x-grid-grouped .x-grid-row-tpl.x-grid-header-wrap {
	border-top: 0
}

.x-scroll-view {
	position: relative;
	display: block;
	overflow: hidden
}

.x-scroll-container {
	position: absolute;
	width: 100%;
	height: 100%
}

.x-scroll-scroller {
	position: absolute;
	min-width: 100%;
	min-height: 100%;
	height: auto !important;
	width: auto !important
}

.x-scroll-stretcher {
	position: absolute;
	visibility: hidden
}

.x-scroll-bar-grid-wrapper {
	position: absolute;
	width: 100%;
	height: 100%
}

.x-scroll-bar-grid {
	display: table;
	width: 100%;
	height: 100%
}

.x-scroll-bar-grid>* {
	display: table-row
}

.x-scroll-bar-grid>*>* {
	display: table-cell
}

.x-scroll-bar-grid> :first-child> :first-child {
	width: 100%;
	height: 100%
}

.x-scroll-bar-grid> :first-child> :nth-child(2) {
	padding: 3px 3px 0 0
}

.x-scroll-bar-grid> :nth-child(2)> :first-child {
	padding: 0 0 3px 3px
}

.x-scroll-bar {
	position: relative;
	overflow: hidden
}

.x-scroll-bar-stretcher {
	position: absolute;
	visibility: hidden;
	width: 100%;
	height: 100%
}

.x-scroll-bar-x {
	width: 100%
}

.x-scroll-bar-x>.x-scroll-bar-stretcher {
	width: 300%
}

.x-scroll-bar-x.active {
	height: 6px
}

.x-scroll-bar-y {
	height: 100%
}

.x-scroll-bar-y>.x-scroll-bar-stretcher {
	height: 300%
}

.x-scroll-bar-y.active {
	width: 6px
}

.x-scroll-indicator {
	background: #333;
	position: absolute;
	z-index: 3
}

.x-scroll-indicator-x {
	height: 100%
}

.x-scroll-indicator-y {
	width: 100%
}

.x-scroll-indicator.rounded {
	background: none
}

.x-scroll-indicator.rounded>* {
	position: absolute;
	background-color: #333
}

.x-scroll-indicator.rounded> :nth-child(2) {
	-webkit-transform-origin: 0% 0%;
	background: none;
	content: url(data:image/bmp;base64,Qk08AAAAAAAAADYAAAAoAAAAAQAAAAEAAAABABAAAAAAAAYAAAASCwAAEgsAAAAAAAAAAAAAxhgAAAAA)
}

.x-scroll-indicator.rounded.x-scroll-indicator-light>* {
	background-color: #eee
}

.x-scroll-indicator.rounded.x-scroll-indicator-light> :nth-child(2) {
	content: url(data:image/bmp;base64,Qk08AAAAAAAAADYAAAAoAAAAAQAAAAEAAAABABAAAAAAAAYAAAASCwAAEgsAAAAAAAAAAAAAvXcAAAAA)
}

.x-scroll-indicator.rounded.x-scroll-indicator-y>* {
	width: 100%
}

.x-scroll-indicator.rounded.x-scroll-indicator-y> :first-child {
	height: 3px;
	-moz-border-radius-topleft: 3px;
	-webkit-border-top-left-radius: 3px;
	border-top-left-radius: 3px;
	-moz-border-radius-topright: 3px;
	-webkit-border-top-right-radius: 3px;
	border-top-right-radius: 3px
}

.x-scroll-indicator.rounded.x-scroll-indicator-y> :nth-child(2) {
	height: 1px
}

.x-scroll-indicator.rounded.x-scroll-indicator-y> :last-child {
	height: 3px;
	-moz-border-radius-bottomleft: 3px;
	-webkit-border-bottom-left-radius: 3px;
	border-bottom-left-radius: 3px;
	-moz-border-radius-bottomright: 3px;
	-webkit-border-bottom-right-radius: 3px;
	border-bottom-right-radius: 3px
}

.x-scroll-indicator.rounded.x-scroll-indicator-x>* {
	height: 100%
}

.x-scroll-indicator.rounded.x-scroll-indicator-x> :first-child {
	width: 3px;
	-moz-border-radius-topleft: 3px;
	-webkit-border-top-left-radius: 3px;
	border-top-left-radius: 3px;
	-moz-border-radius-bottomleft: 3px;
	-webkit-border-bottom-left-radius: 3px;
	border-bottom-left-radius: 3px
}

.x-scroll-indicator.rounded.x-scroll-indicator-x> :nth-child(2) {
	width: 1px
}

.x-scroll-indicator.rounded.x-scroll-indicator-x> :last-child {
	width: 3px;
	-moz-border-radius-topright: 3px;
	-webkit-border-top-right-radius: 3px;
	border-top-right-radius: 3px;
	-moz-border-radius-bottomright: 3px;
	-webkit-border-bottom-right-radius: 3px;
	border-bottom-right-radius: 3px
}

.x-list-light .x-scroll-indicator,
.x-dataview-light .x-scroll-indicator {
	background: #fff
}

.x-ios .x-scroll-scroller {
	-webkit-transform: translate3d(0, 0, 0)
}

.x-ie .x-scroll-bar-y {
	position: absolute;
	margin-left: -5px
}

html,
body {
	font-family: "Open Sans", "Avenir Next", Avenir, Calibri, Roboto, sans-serif
}

.x-ios.x-tablet .x-landscape * {
	-webkit-text-stroke: 1px transparent
}

body {
	font-size: 104%
}

body.x-android.x-phone {
	font-size: 116%
}

body.x-ios.x-phone {
	font-size: 114%
}

body.x-desktop {
	font-size: 114%
}

.x-layout-card-item {
	background: #eee
}

.x-loading-spinner {
	font-size: 250%;
	height: 1em;
	width: 1em;
	position: relative;
	-webkit-transform-origin: 0.5em 0.5em;
	transform-origin: 0.5em 0.5em
}

.x-loading-spinner>span,
.x-loading-spinner>span:before,
.x-loading-spinner>span:after {
	display: block;
	position: absolute;
	width: 0.1em;
	height: 0.25em;
	top: 0;
	-webkit-transform-origin: 0.05em 0.5em;
	transform-origin: 0.05em 0.5em;
	content: " "
}

.x-loading-spinner>span {
	left: 50%;
	margin-left: -0.05em
}

.x-loading-spinner>span.x-loading-top {
	background-color: rgba(170, 170, 170, 0.99)
}

.x-loading-spinner>span.x-loading-top::after {
	background-color: rgba(170, 170, 170, 0.9)
}

.x-loading-spinner>span.x-loading-left::before {
	background-color: rgba(170, 170, 170, 0.8)
}

.x-loading-spinner>span.x-loading-left {
	background-color: rgba(170, 170, 170, 0.7)
}

.x-loading-spinner>span.x-loading-left::after {
	background-color: rgba(170, 170, 170, 0.6)
}

.x-loading-spinner>span.x-loading-bottom::before {
	background-color: rgba(170, 170, 170, 0.5)
}

.x-loading-spinner>span.x-loading-bottom {
	background-color: rgba(170, 170, 170, 0.4)
}

.x-loading-spinner>span.x-loading-bottom::after {
	background-color: rgba(170, 170, 170, 0.35)
}

.x-loading-spinner>span.x-loading-right::before {
	background-color: rgba(170, 170, 170, 0.3)
}

.x-loading-spinner>span.x-loading-right {
	background-color: rgba(170, 170, 170, 0.25)
}

.x-loading-spinner>span.x-loading-right::after {
	background-color: rgba(170, 170, 170, 0.2)
}

.x-loading-spinner>span.x-loading-top::before {
	background-color: rgba(170, 170, 170, 0.15)
}

.x-loading-spinner>span.x-loading-top {
	-webkit-transform: rotate(0deg);
	-moz-transform: rotate(0deg);
	-ms-transform: rotate(0deg)
}

.x-loading-spinner>span.x-loading-right {
	-webkit-transform: rotate(90deg);
	-moz-transform: rotate(90deg);
	-ms-transform: rotate(90deg)
}

.x-loading-spinner>span.x-loading-bottom {
	-webkit-transform: rotate(180deg);
	-moz-transform: rotate(180deg);
	-ms-transform: rotate(180deg)
}

.x-loading-spinner>span.x-loading-left {
	-webkit-transform: rotate(270deg);
	-moz-transform: rotate(270deg);
	-ms-transform: rotate(270deg)
}

.x-loading-spinner>span::before {
	-webkit-transform: rotate(30deg);
	-moz-transform: rotate(30deg);
	-ms-transform: rotate(30deg)
}

.x-loading-spinner>span::after {
	-webkit-transform: rotate(-30deg);
	-moz-transform: rotate(-30deg);
	-ms-transform: rotate(-30deg)
}

.x-loading-spinner {
	-webkit-animation-name: x-loading-spinner-rotate;
	-webkit-animation-duration: .5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: linear;
	animation-name: x-loading-spinner-rotate;
	animation-duration: .5s;
	animation-timing-function: linear;
	animation-iteration-count: infinite
}

html,
body {
	font-family: "Open Sans", "Avenir Next", Avenir, Calibri, Roboto, sans-serif
}

.x-ios.x-tablet .x-landscape * {
	-webkit-text-stroke: 1px transparent
}

body {
	font-size: 104%
}

body.x-android.x-phone {
	font-size: 116%
}

body.x-ios.x-phone {
	font-size: 114%
}

body.x-desktop {
	font-size: 114%
}

.x-layout-card-item {
	background: #eee
}

.x-button {
	-webkit-background-clip: padding;
	-moz-background-clip: padding;
	background-clip: padding-box;
	-webkit-border-radius: 0.4em;
	-moz-border-radius: 0.4em;
	-ms-border-radius: 0.4em;
	-o-border-radius: 0.4em;
	border-radius: 0.4em;
	min-height: 1.8em;
	padding: .3em .6em
}

.x-button,
.x-toolbar .x-button {
	border: 1px solid #999;
	border-top-color: #a6a6a6;
	background-color: #ccc;
	color: #000
}

.x-button.x-button-back:before,
.x-button.x-button-forward:before,
.x-toolbar .x-button.x-button-back:before,
.x-toolbar .x-button.x-button-forward:before {
	background: #999
}

.x-button,
.x-button.x-button-back:after,
.x-button.x-button-forward:after,
.x-toolbar .x-button,
.x-toolbar .x-button.x-button-back:after,
.x-toolbar .x-button.x-button-forward:after {
	background-image: none;
	background-color: #ccc
}

.x-button.x-button-pressing,
.x-button.x-button-pressing:after,
.x-button.x-button-pressed,
.x-button.x-button-pressed:after,
.x-button.x-button-active,
.x-button.x-button-active:after,
.x-toolbar .x-button.x-button-pressing,
.x-toolbar .x-button.x-button-pressing:after,
.x-toolbar .x-button.x-button-pressed,
.x-toolbar .x-button.x-button-pressed:after,
.x-toolbar .x-button.x-button-active,
.x-toolbar .x-button.x-button-active:after {
	background-image: none;
	background-color: #c4c4c4;
	background-image: -webkit-linear-gradient(top, #ababab, #b8b8b8 10%, #c4c4c4 65%, #c6c6c6);
	background-image: -moz-linear-gradient(top, #ababab, #b8b8b8 10%, #c4c4c4 65%, #c6c6c6);
	background-image: -o-linear-gradient(top, #ababab, #b8b8b8 10%, #c4c4c4 65%, #c6c6c6);
	background-image: -ms-linear-gradient(top, #ababab, #b8b8b8 10%, #c4c4c4 65%, #c6c6c6)
}

.x-button .x-button-icon {
	width: 1.5em;
	height: 1.5em
}

.x-button .x-button-icon:before {
	font-size: 1.6em;
	line-height: 1em
}

.x-button.x-item-disabled .x-button-label,
.x-button.x-item-disabled .x-badge,
.x-button.x-item-disabled .x-hasbadge .x-badge,
.x-hasbadge .x-button.x-item-disabled .x-badge,
.x-button.x-item-disabled .x-button-icon {
	opacity: .5
}

.x-button-round,
.x-button.x-button-action-round,
.x-button.x-button-confirm-round,
.x-button.x-button-decline-round {
	-webkit-border-radius: 0.9em;
	-moz-border-radius: 0.9em;
	-ms-border-radius: 0.9em;
	-o-border-radius: 0.9em;
	border-radius: 0.9em
}

.x-ie .x-button {
	height: 0px
}

.x-ie .x-button .x-button-label,
.x-ie .x-button .x-badge,
.x-ie .x-button .x-hasbadge .x-badge,
.x-hasbadge .x-ie .x-button .x-badge {
	overflow: visible
}

.x-iconalign-left .x-button-label,
.x-iconalign-left .x-badge,
.x-iconalign-left .x-hasbadge .x-badge,
.x-hasbadge .x-iconalign-left .x-badge {
	margin-left: .6em
}

.x-iconalign-right .x-button-label,
.x-iconalign-right .x-badge,
.x-iconalign-right .x-hasbadge .x-badge,
.x-hasbadge .x-iconalign-right .x-badge {
	margin-right: .6em
}

.x-iconalign-top,
.x-iconalign-bottom {
	padding-top: .2em !important;
	padding-bottom: .2em !important
}

.x-button-label,
.x-badge,
.x-hasbadge .x-badge {
	font-weight: bold;
	line-height: 1.2em;
	font-family: "Open Sans", "Avenir Next", Avenir, Calibri, Roboto, sans-serif;
	font-size: 1em
}

.x-toolbar .x-button {
	margin: 6px .2em;
	padding: 0 .6em
}

.x-toolbar .x-button .x-button-label,
.x-toolbar .x-button .x-badge,
.x-toolbar .x-button .x-hasbadge .x-badge,
.x-hasbadge .x-toolbar .x-button .x-badge {
	font-size: .7em
}

.x-toolbar .x-button .x-button-label,
.x-toolbar .x-button .x-badge,
.x-toolbar .x-button .x-hasbadge .x-badge,
.x-hasbadge .x-toolbar .x-button .x-badge,
.x-toolbar .x-button .x-hasbadge .x-badge {
	line-height: 1.6em
}

.x-toolbar .x-button .x-button-icon:before {
	font-size: 1.3em;
	line-height: 1.3em
}

.x-ie .x-toolbar .x-button .x-button-icon::before {
	font-size: .6em;
	line-height: 1em
}

.x-button-small,
.x-button.x-button-action-small,
.x-button.x-button-confirm-small,
.x-button.x-button-decline-small,
.x-toolbar .x-button-small,
.x-toolbar .x-button.x-button-action-small,
.x-toolbar .x-button.x-button-confirm-small,
.x-toolbar .x-button.x-button-decline-small {
	-webkit-border-radius: 0.3em;
	-moz-border-radius: 0.3em;
	-ms-border-radius: 0.3em;
	-o-border-radius: 0.3em;
	border-radius: 0.3em;
	padding: .2em .4em;
	min-height: 0
}

.x-button-small .x-button-label,
.x-button.x-button-action-small .x-button-label,
.x-button.x-button-confirm-small .x-button-label,
.x-button.x-button-decline-small .x-button-label,
.x-button-small .x-badge,
.x-button.x-button-action-small .x-badge,
.x-button.x-button-confirm-small .x-badge,
.x-button.x-button-decline-small .x-badge,
.x-button-small .x-hasbadge .x-badge,
.x-hasbadge .x-button-small .x-badge,
.x-button.x-button-action-small .x-hasbadge .x-badge,
.x-hasbadge .x-button.x-button-action-small .x-badge,
.x-button.x-button-confirm-small .x-hasbadge .x-badge,
.x-hasbadge .x-button.x-button-confirm-small .x-badge,
.x-button.x-button-decline-small .x-hasbadge .x-badge,
.x-hasbadge .x-button.x-button-decline-small .x-badge,
.x-toolbar .x-button-small .x-button-label,
.x-toolbar .x-button.x-button-action-small .x-button-label,
.x-toolbar .x-button.x-button-confirm-small .x-button-label,
.x-toolbar .x-button.x-button-decline-small .x-button-label,
.x-toolbar .x-button-small .x-badge,
.x-toolbar .x-button.x-button-action-small .x-badge,
.x-toolbar .x-button.x-button-confirm-small .x-badge,
.x-toolbar .x-button.x-button-decline-small .x-badge,
.x-toolbar .x-button-small .x-hasbadge .x-badge,
.x-hasbadge .x-toolbar .x-button-small .x-badge,
.x-toolbar .x-button.x-button-action-small .x-hasbadge .x-badge,
.x-hasbadge .x-toolbar .x-button.x-button-action-small .x-badge,
.x-toolbar .x-button.x-button-confirm-small .x-hasbadge .x-badge,
.x-hasbadge .x-toolbar .x-button.x-button-confirm-small .x-badge,
.x-toolbar .x-button.x-button-decline-small .x-hasbadge .x-badge,
.x-hasbadge .x-toolbar .x-button.x-button-decline-small .x-badge {
	font-size: .6em
}

.x-button-small .x-button-icon,
.x-button.x-button-action-small .x-button-icon,
.x-button.x-button-confirm-small .x-button-icon,
.x-button.x-button-decline-small .x-button-icon,
.x-toolbar .x-button-small .x-button-icon,
.x-toolbar .x-button.x-button-action-small .x-button-icon,
.x-toolbar .x-button.x-button-confirm-small .x-button-icon,
.x-toolbar .x-button.x-button-decline-small .x-button-icon {
	width: .75em;
	height: .75em
}

.x-button-forward,
.x-button-back {
	position: relative;
	overflow: visible;
	height: 1.7em;
	z-index: 1
}

.x-webkit .x-button-forward:before,
.x-webkit .x-button-forward:after,
.x-webkit .x-button-back:before,
.x-webkit .x-button-back:after {
	content: '';
	position: absolute;
	width: 15px;
	height: auto;
	top: -2px;
	left: auto;
	bottom: -2px;
	z-index: 2;
	-webkit-mask: 4px 0 url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAABGCAYAAADb7SQ4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAiNJREFUeNrEWb9LQlEUvj5BcHoQvMnVKXD1D3CLwqBJbHJsazQaWoSCxgbHJiMIAiNok6AhCDdXVycnJ8EQOgeOYaG+d39998KH+HyP753zzjnfd325xfdSgVeV8B6BScuEV0IRSbxHeCMk/AVFXCA8ScQKSXxPqK0fQBBfE5r/D+Y8VzUT9jb94DPimqRYIYkrhGcpKhhxIqTxrpNcExdlQJTTTnRJnCc8ykhUSOIOoZ71ZFfEZ4S2zgUu+rguxZRHEnPbfKRVsOtUl0RtYpOLTYljIS2Z3nVk2DY9SbNCEt8RDm0rUpe4La1jvXSqmtum72raZI24KuNQIYl/nSGSOJb0Jq61M0pxhjwK9304hUjHGSKILzc5Q5drUzttdYY+I97pDH1FzG0zNFUb04gTG4kzJS5kdYauiZtZnaFr4ooKsCIVaDHxKAQxt1NBnGIVHfGCcEQYh3jGU8KBfMKLiyM+lgzAq/qT0ArVTg+Ei1B9fEPoovV4fcfQd2HedScX39GprwGTNjJn0maTELN6IuSzECLB6T5x2eM66jQgnIeSxa60GnS3uL56tr7b1Ai0JPVwYi6yho2U2lgfKym19VxjMRHzEGbvS9K+RBPzetGVUpf29lZHSl2/DMnLvwh1ZMQrKW3Ic4fvJOZS6ZMQW5hpmpT63DvtlFLfm7bBNruM2C2yXb7y3U6ZpRS5P/4jpUjihRTbCJ3q1eL3GMMfAQYAJmB6SBO619IAAAAASUVORK5CYII=') no-repeat;
	-webkit-mask-size: 15px 100%;
	overflow: hidden
}

.x-webkit .x-button-back,
.x-webkit .x-toolbar .x-button-back {
	margin-left: 0.772em;
	padding-left: .4em
}

.x-webkit .x-button-back:before,
.x-webkit .x-toolbar .x-button-back:before {
	left: -15px
}

.x-webkit .x-button-back:after,
.x-webkit .x-toolbar .x-button-back:after {
	left: -14px
}

.x-webkit .x-button-forward,
.x-webkit .x-toolbar .x-button-forward {
	margin-right: 0.782em;
	padding-right: .4em
}

.x-webkit .x-button-forward:before,
.x-webkit .x-button-forward:after,
.x-webkit .x-toolbar .x-button-forward:before,
.x-webkit .x-toolbar .x-button-forward:after {
	-webkit-mask: -4px 0 url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAABGCAYAAADb7SQ4AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAXlJREFUaN7lmTFqAlEQhh8EhFSCYJXW1law9QAewMrWAwQWAmmtbPcGHiCQ1gPYCla2QsDKSsgmQecvFqImu2/fzry/2OLb9mt23vwz47Kvn5MwEFxM8DkLB6HHEIOd0GGIwUpoMcRgyRKDOUsMJizxpzBiiMFR6DPEeZl1GWKwFh4ZYvAmPDDEqmVWVQxmLPG3MGaIVcosVAz2whNDDDZCmyEG7yFlpiEGKUsMEpb4XKXMtMXeiVVb7J1YLcRgW1ZmVuLSxGopLkys1mLwwhL/mVhjie8Sayxx3kp7DPFVYo0tzhNriyEGU5Z40TjxtDE/F6WcDowHBE/msDFNImG0xZQRBAonDCvxhhH2vKZIZ9Ds+7EDfaWFnKZ4xhja5owxdcnYCAQv1p1Gi4sprn08cZbDt6ZYZasXIn5mLFHTjLCvVt1V+4rVt/M+4r3FPaJMbHaBKRKb3pyKxKZXtv/Er4yjZpRL6q042u34tzh4xV9H/FHnqBHKBQeEd6aqqwD6AAAAAElFTkSuQmCC') no-repeat;
	-webkit-mask-size: 15px 100%
}

.x-webkit .x-button-forward:before,
.x-webkit .x-toolbar .x-button-forward:before {
	right: -15px
}

.x-webkit .x-button-forward:after,
.x-webkit .x-toolbar .x-button-forward:after {
	right: -14px
}

.x-button.x-button-plain,
.x-toolbar .x-button.x-button-plain {
	background: none;
	border: 0 none;
	min-height: 0;
	text-shadow: none;
	line-height: auto;
	height: 1.9em;
	padding: 0 0.5em;
	-webkit-border-radius: none;
	-moz-border-radius: none;
	-ms-border-radius: none;
	-o-border-radius: none;
	border-radius: none
}

.x-button.x-button-plain>*,
.x-toolbar .x-button.x-button-plain>* {
	overflow: visible
}

.x-button.x-button-plain.x-button-pressing,
.x-button.x-button-plain.x-button-pressed,
.x-toolbar .x-button.x-button-plain.x-button-pressing,
.x-toolbar .x-button.x-button-plain.x-button-pressed {
	background: none;
	background-image: -webkit-radial-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0) 24px);
	background-image: -moz-radial-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0) 24px);
	background-image: -o-radial-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0) 24px);
	background-image: -ms-radial-gradient(rgba(255, 255, 255, 0.7), rgba(255, 255, 255, 0) 24px)
}

.x-segmentedbutton .x-button {
	margin: 0;
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	-ms-border-radius: 0;
	-o-border-radius: 0;
	border-radius: 0
}

.x-segmentedbutton .x-button.x-first {
	-moz-border-radius-topleft: 0.4em;
	-webkit-border-top-left-radius: 0.4em;
	border-top-left-radius: 0.4em;
	-moz-border-radius-bottomleft: 0.4em;
	-webkit-border-bottom-left-radius: 0.4em;
	border-bottom-left-radius: 0.4em
}

.x-segmentedbutton .x-button.x-last {
	-moz-border-radius-topright: 0.4em;
	-webkit-border-top-right-radius: 0.4em;
	border-top-right-radius: 0.4em;
	-moz-border-radius-bottomright: 0.4em;
	-webkit-border-bottom-right-radius: 0.4em;
	border-bottom-right-radius: 0.4em
}

.x-segmentedbutton .x-button:not(.x-first) {
	border-left: 0
}

.x-hasbadge {
	overflow: visible
}

.x-hasbadge .x-badge {
	border-color: #900;
	min-width: 2em;
	line-height: 1.2em;
	top: -0.2em;
	padding: .1em .3em;
	-webkit-background-clip: padding;
	-moz-background-clip: padding;
	background-clip: padding-box;
	color: #fcc;
	background-image: none;
	background-color: #c00;
	-webkit-border-radius: 0.2em;
	-moz-border-radius: 0.2em;
	-ms-border-radius: 0.2em;
	-o-border-radius: 0.2em;
	border-radius: 0.2em;
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0;
	-webkit-box-shadow: rgba(0, 0, 0, 0.5) 0 0.1em 0.1em;
	-moz-box-shadow: rgba(0, 0, 0, 0.5) 0 0.1em 0.1em;
	box-shadow: rgba(0, 0, 0, 0.5) 0 0.1em 0.1em
}

.x-tab .x-button-icon.calendar:before,
.x-button .x-button-icon.calendar:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "\\005C"
}

.x-tab .x-button-icon.action:before,
.x-button .x-button-icon.action:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "R"
}

.x-tab .x-button-icon.add:before,
.x-button .x-button-icon.add:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "&"
}

.x-tab .x-button-icon.arrow_down:before,
.x-button .x-button-icon.arrow_down:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "}"
}

.x-tab .x-button-icon.arrow_left:before,
.x-button .x-button-icon.arrow_left:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "["
}

.x-tab .x-button-icon.arrow_right:before,
.x-button .x-button-icon.arrow_right:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "]"
}

.x-tab .x-button-icon.arrow_up:before,
.x-button .x-button-icon.arrow_up:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content:"{"
}

.x-tab .x-button-icon.compose:before,
.x-button .x-button-icon.compose:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "W"
}

.x-tab .x-button-icon.delete:before,
.x-button .x-button-icon.delete:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "*"
}

.x-tab .x-button-icon.organize:before,
.x-button .x-button-icon.organize:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "I"
}

.x-tab .x-button-icon.refresh:before,
.x-button .x-button-icon.refresh:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "1"
}

.x-tab .x-button-icon.reply:before,
.x-button .x-button-icon.reply:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "R"
}

.x-tab .x-button-icon.search:before,
.x-button .x-button-icon.search:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "s"
}

.x-tab .x-button-icon.settings:before,
.x-button .x-button-icon.settings:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "y"
}

.x-tab .x-button-icon.star:before,
.x-button .x-button-icon.star:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "S"
}

.x-tab .x-button-icon.trash:before,
.x-button .x-button-icon.trash:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "#"
}

.x-tab .x-button-icon.maps:before,
.x-button .x-button-icon.maps:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "@"
}

.x-tab .x-button-icon.locate:before,
.x-button .x-button-icon.locate:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "@"
}

.x-tab .x-button-icon.home:before,
.x-button .x-button-icon.home:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "H"
}

.x-tab .x-button-icon.bookmarks:before,
.x-button .x-button-icon.bookmarks:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "I"
}

.x-tab .x-button-icon.download:before,
.x-button .x-button-icon.download:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "~"
}

.x-tab .x-button-icon.favorites:before,
.x-button .x-button-icon.favorites:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "S"
}

.x-tab .x-button-icon.info:before,
.x-button .x-button-icon.info:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "i"
}

.x-tab .x-button-icon.more:before,
.x-button .x-button-icon.more:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "."
}

.x-tab .x-button-icon.time:before,
.x-button .x-button-icon.time:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "t"
}

.x-tab .x-button-icon.user:before,
.x-button .x-button-icon.user:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "U"
}

.x-tab .x-button-icon.team:before,
.x-button .x-button-icon.team:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "g"
}

.x-button.x-button-action,
.x-toolbar .x-button.x-button-action,
.x-button.x-button-action-round,
.x-toolbar .x-button.x-button-action-round,
.x-button.x-button-action-small,
.x-toolbar .x-button.x-button-action-small {
	border: 1px solid #b78900;
	border-top-color: #d19c00;
	background-color: #ffc61e;
	color: #000
}

.x-button.x-button-action.x-button-back:before,
.x-button.x-button-action.x-button-forward:before,
.x-toolbar .x-button.x-button-action.x-button-back:before,
.x-toolbar .x-button.x-button-action.x-button-forward:before,
.x-button.x-button-action-round.x-button-back:before,
.x-button.x-button-action-round.x-button-forward:before,
.x-toolbar .x-button.x-button-action-round.x-button-back:before,
.x-toolbar .x-button.x-button-action-round.x-button-forward:before,
.x-button.x-button-action-small.x-button-back:before,
.x-button.x-button-action-small.x-button-forward:before,
.x-toolbar .x-button.x-button-action-small.x-button-back:before,
.x-toolbar .x-button.x-button-action-small.x-button-forward:before {
	background: #b78900
}

.x-button.x-button-action,
.x-button.x-button-action.x-button-back:after,
.x-button.x-button-action.x-button-forward:after,
.x-toolbar .x-button.x-button-action,
.x-toolbar .x-button.x-button-action.x-button-back:after,
.x-toolbar .x-button.x-button-action.x-button-forward:after,
.x-button.x-button-action-round,
.x-button.x-button-action-round.x-button-back:after,
.x-button.x-button-action-round.x-button-forward:after,
.x-toolbar .x-button.x-button-action-round,
.x-toolbar .x-button.x-button-action-round.x-button-back:after,
.x-toolbar .x-button.x-button-action-round.x-button-forward:after,
.x-button.x-button-action-small,
.x-button.x-button-action-small.x-button-back:after,
.x-button.x-button-action-small.x-button-forward:after,
.x-toolbar .x-button.x-button-action-small,
.x-toolbar .x-button.x-button-action-small.x-button-back:after,
.x-toolbar .x-button.x-button-action-small.x-button-forward:after {
	background-image: none;
	background-color: #ffc61e
}

.x-button.x-button-action.x-button-pressing,
.x-button.x-button-action.x-button-pressing:after,
.x-button.x-button-action.x-button-pressed,
.x-button.x-button-action.x-button-pressed:after,
.x-button.x-button-action.x-button-active,
.x-button.x-button-action.x-button-active:after,
.x-toolbar .x-button.x-button-action.x-button-pressing,
.x-toolbar .x-button.x-button-action.x-button-pressing:after,
.x-toolbar .x-button.x-button-action.x-button-pressed,
.x-toolbar .x-button.x-button-action.x-button-pressed:after,
.x-toolbar .x-button.x-button-action.x-button-active,
.x-toolbar .x-button.x-button-action.x-button-active:after,
.x-button.x-button-action-round.x-button-pressing,
.x-button.x-button-action-round.x-button-pressing:after,
.x-button.x-button-action-round.x-button-pressed,
.x-button.x-button-action-round.x-button-pressed:after,
.x-button.x-button-action-round.x-button-active,
.x-button.x-button-action-round.x-button-active:after,
.x-toolbar .x-button.x-button-action-round.x-button-pressing,
.x-toolbar .x-button.x-button-action-round.x-button-pressing:after,
.x-toolbar .x-button.x-button-action-round.x-button-pressed,
.x-toolbar .x-button.x-button-action-round.x-button-pressed:after,
.x-toolbar .x-button.x-button-action-round.x-button-active,
.x-toolbar .x-button.x-button-action-round.x-button-active:after,
.x-button.x-button-action-small.x-button-pressing,
.x-button.x-button-action-small.x-button-pressing:after,
.x-button.x-button-action-small.x-button-pressed,
.x-button.x-button-action-small.x-button-pressed:after,
.x-button.x-button-action-small.x-button-active,
.x-button.x-button-action-small.x-button-active:after,
.x-toolbar .x-button.x-button-action-small.x-button-pressing,
.x-toolbar .x-button.x-button-action-small.x-button-pressing:after,
.x-toolbar .x-button.x-button-action-small.x-button-pressed,
.x-toolbar .x-button.x-button-action-small.x-button-pressed:after,
.x-toolbar .x-button.x-button-action-small.x-button-active,
.x-toolbar .x-button.x-button-action-small.x-button-active:after {
	background-image: none;
	background-color: #ffc20f;
	background-image: -webkit-linear-gradient(top, #dba300, #f4b600 10%, #ffc20f 65%, #ffc311);
	background-image: -moz-linear-gradient(top, #dba300, #f4b600 10%, #ffc20f 65%, #ffc311);
	background-image: -o-linear-gradient(top, #dba300, #f4b600 10%, #ffc20f 65%, #ffc311);
	background-image: -ms-linear-gradient(top, #dba300, #f4b600 10%, #ffc20f 65%, #ffc311)
}

.x-button.x-button-confirm,
.x-toolbar .x-button.x-button-confirm,
.x-button.x-button-confirm-round,
.x-toolbar .x-button.x-button-confirm-round,
.x-button.x-button-confirm-small,
.x-toolbar .x-button.x-button-confirm-small {
	border: 1px solid #263501;
	border-top-color: #374e02;
	background-color: #6c9804;
	color: #fff
}

.x-button.x-button-confirm.x-button-back:before,
.x-button.x-button-confirm.x-button-forward:before,
.x-toolbar .x-button.x-button-confirm.x-button-back:before,
.x-toolbar .x-button.x-button-confirm.x-button-forward:before,
.x-button.x-button-confirm-round.x-button-back:before,
.x-button.x-button-confirm-round.x-button-forward:before,
.x-toolbar .x-button.x-button-confirm-round.x-button-back:before,
.x-toolbar .x-button.x-button-confirm-round.x-button-forward:before,
.x-button.x-button-confirm-small.x-button-back:before,
.x-button.x-button-confirm-small.x-button-forward:before,
.x-toolbar .x-button.x-button-confirm-small.x-button-back:before,
.x-toolbar .x-button.x-button-confirm-small.x-button-forward:before {
	background: #263501
}

.x-button.x-button-confirm,
.x-button.x-button-confirm.x-button-back:after,
.x-button.x-button-confirm.x-button-forward:after,
.x-toolbar .x-button.x-button-confirm,
.x-toolbar .x-button.x-button-confirm.x-button-back:after,
.x-toolbar .x-button.x-button-confirm.x-button-forward:after,
.x-button.x-button-confirm-round,
.x-button.x-button-confirm-round.x-button-back:after,
.x-button.x-button-confirm-round.x-button-forward:after,
.x-toolbar .x-button.x-button-confirm-round,
.x-toolbar .x-button.x-button-confirm-round.x-button-back:after,
.x-toolbar .x-button.x-button-confirm-round.x-button-forward:after,
.x-button.x-button-confirm-small,
.x-button.x-button-confirm-small.x-button-back:after,
.x-button.x-button-confirm-small.x-button-forward:after,
.x-toolbar .x-button.x-button-confirm-small,
.x-toolbar .x-button.x-button-confirm-small.x-button-back:after,
.x-toolbar .x-button.x-button-confirm-small.x-button-forward:after {
	background-image: none;
	background-color: #6c9804
}

.x-button.x-button-confirm.x-button-pressing,
.x-button.x-button-confirm.x-button-pressing:after,
.x-button.x-button-confirm.x-button-pressed,
.x-button.x-button-confirm.x-button-pressed:after,
.x-button.x-button-confirm.x-button-active,
.x-button.x-button-confirm.x-button-active:after,
.x-toolbar .x-button.x-button-confirm.x-button-pressing,
.x-toolbar .x-button.x-button-confirm.x-button-pressing:after,
.x-toolbar .x-button.x-button-confirm.x-button-pressed,
.x-toolbar .x-button.x-button-confirm.x-button-pressed:after,
.x-toolbar .x-button.x-button-confirm.x-button-active,
.x-toolbar .x-button.x-button-confirm.x-button-active:after,
.x-button.x-button-confirm-round.x-button-pressing,
.x-button.x-button-confirm-round.x-button-pressing:after,
.x-button.x-button-confirm-round.x-button-pressed,
.x-button.x-button-confirm-round.x-button-pressed:after,
.x-button.x-button-confirm-round.x-button-active,
.x-button.x-button-confirm-round.x-button-active:after,
.x-toolbar .x-button.x-button-confirm-round.x-button-pressing,
.x-toolbar .x-button.x-button-confirm-round.x-button-pressing:after,
.x-toolbar .x-button.x-button-confirm-round.x-button-pressed,
.x-toolbar .x-button.x-button-confirm-round.x-button-pressed:after,
.x-toolbar .x-button.x-button-confirm-round.x-button-active,
.x-toolbar .x-button.x-button-confirm-round.x-button-active:after,
.x-button.x-button-confirm-small.x-button-pressing,
.x-button.x-button-confirm-small.x-button-pressing:after,
.x-button.x-button-confirm-small.x-button-pressed,
.x-button.x-button-confirm-small.x-button-pressed:after,
.x-button.x-button-confirm-small.x-button-active,
.x-button.x-button-confirm-small.x-button-active:after,
.x-toolbar .x-button.x-button-confirm-small.x-button-pressing,
.x-toolbar .x-button.x-button-confirm-small.x-button-pressing:after,
.x-toolbar .x-button.x-button-confirm-small.x-button-pressed,
.x-toolbar .x-button.x-button-confirm-small.x-button-pressed:after,
.x-toolbar .x-button.x-button-confirm-small.x-button-active,
.x-toolbar .x-button.x-button-confirm-small.x-button-active:after {
	background-image: none;
	background-color: #628904;
	background-image: -webkit-linear-gradient(top, #3e5702, #507003 10%, #628904 65%, #648c04);
	background-image: -moz-linear-gradient(top, #3e5702, #507003 10%, #628904 65%, #648c04);
	background-image: -o-linear-gradient(top, #3e5702, #507003 10%, #628904 65%, #648c04);
	background-image: -ms-linear-gradient(top, #3e5702, #507003 10%, #628904 65%, #648c04)
}

.x-button.x-button-decline,
.x-toolbar .x-button.x-button-decline,
.x-button.x-button-decline-round,
.x-toolbar .x-button.x-button-decline-round,
.x-button.x-button-decline-small,
.x-toolbar .x-button.x-button-decline-small {
	border: 1px solid #630303;
	border-top-color: #7c0303;
	background-color: #c70505;
	color: #fff
}

.x-button.x-button-decline.x-button-back:before,
.x-button.x-button-decline.x-button-forward:before,
.x-toolbar .x-button.x-button-decline.x-button-back:before,
.x-toolbar .x-button.x-button-decline.x-button-forward:before,
.x-button.x-button-decline-round.x-button-back:before,
.x-button.x-button-decline-round.x-button-forward:before,
.x-toolbar .x-button.x-button-decline-round.x-button-back:before,
.x-toolbar .x-button.x-button-decline-round.x-button-forward:before,
.x-button.x-button-decline-small.x-button-back:before,
.x-button.x-button-decline-small.x-button-forward:before,
.x-toolbar .x-button.x-button-decline-small.x-button-back:before,
.x-toolbar .x-button.x-button-decline-small.x-button-forward:before {
	background: #630303
}

.x-button.x-button-decline,
.x-button.x-button-decline.x-button-back:after,
.x-button.x-button-decline.x-button-forward:after,
.x-toolbar .x-button.x-button-decline,
.x-toolbar .x-button.x-button-decline.x-button-back:after,
.x-toolbar .x-button.x-button-decline.x-button-forward:after,
.x-button.x-button-decline-round,
.x-button.x-button-decline-round.x-button-back:after,
.x-button.x-button-decline-round.x-button-forward:after,
.x-toolbar .x-button.x-button-decline-round,
.x-toolbar .x-button.x-button-decline-round.x-button-back:after,
.x-toolbar .x-button.x-button-decline-round.x-button-forward:after,
.x-button.x-button-decline-small,
.x-button.x-button-decline-small.x-button-back:after,
.x-button.x-button-decline-small.x-button-forward:after,
.x-toolbar .x-button.x-button-decline-small,
.x-toolbar .x-button.x-button-decline-small.x-button-back:after,
.x-toolbar .x-button.x-button-decline-small.x-button-forward:after {
	background-image: none;
	background-color: #c70505
}

.x-button.x-button-decline.x-button-pressing,
.x-button.x-button-decline.x-button-pressing:after,
.x-button.x-button-decline.x-button-pressed,
.x-button.x-button-decline.x-button-pressed:after,
.x-button.x-button-decline.x-button-active,
.x-button.x-button-decline.x-button-active:after,
.x-toolbar .x-button.x-button-decline.x-button-pressing,
.x-toolbar .x-button.x-button-decline.x-button-pressing:after,
.x-toolbar .x-button.x-button-decline.x-button-pressed,
.x-toolbar .x-button.x-button-decline.x-button-pressed:after,
.x-toolbar .x-button.x-button-decline.x-button-active,
.x-toolbar .x-button.x-button-decline.x-button-active:after,
.x-button.x-button-decline-round.x-button-pressing,
.x-button.x-button-decline-round.x-button-pressing:after,
.x-button.x-button-decline-round.x-button-pressed,
.x-button.x-button-decline-round.x-button-pressed:after,
.x-button.x-button-decline-round.x-button-active,
.x-button.x-button-decline-round.x-button-active:after,
.x-toolbar .x-button.x-button-decline-round.x-button-pressing,
.x-toolbar .x-button.x-button-decline-round.x-button-pressing:after,
.x-toolbar .x-button.x-button-decline-round.x-button-pressed,
.x-toolbar .x-button.x-button-decline-round.x-button-pressed:after,
.x-toolbar .x-button.x-button-decline-round.x-button-active,
.x-toolbar .x-button.x-button-decline-round.x-button-active:after,
.x-button.x-button-decline-small.x-button-pressing,
.x-button.x-button-decline-small.x-button-pressing:after,
.x-button.x-button-decline-small.x-button-pressed,
.x-button.x-button-decline-small.x-button-pressed:after,
.x-button.x-button-decline-small.x-button-active,
.x-button.x-button-decline-small.x-button-active:after,
.x-toolbar .x-button.x-button-decline-small.x-button-pressing,
.x-toolbar .x-button.x-button-decline-small.x-button-pressing:after,
.x-toolbar .x-button.x-button-decline-small.x-button-pressed,
.x-toolbar .x-button.x-button-decline-small.x-button-pressed:after,
.x-toolbar .x-button.x-button-decline-small.x-button-active,
.x-toolbar .x-button.x-button-decline-small.x-button-active:after {
	background-image: none;
	background-color: #b80505;
	background-image: -webkit-linear-gradient(top, #860303, #9f0404 10%, #b80505 65%, #ba0505);
	background-image: -moz-linear-gradient(top, #860303, #9f0404 10%, #b80505 65%, #ba0505);
	background-image: -o-linear-gradient(top, #860303, #9f0404 10%, #b80505 65%, #ba0505);
	background-image: -ms-linear-gradient(top, #860303, #9f0404 10%, #b80505 65%, #ba0505)
}

.x-panel.x-floating,
.x-msgbox,
.x-form.x-floating {
	-webkit-border-radius: 0.3em;
	-moz-border-radius: 0.3em;
	-ms-border-radius: 0.3em;
	-o-border-radius: 0.3em;
	border-radius: 0.3em;
	-webkit-box-shadow: rgba(0, 0, 0, 0.8) 0 0.2em 0.6em;
	-moz-box-shadow: rgba(0, 0, 0, 0.8) 0 0.2em 0.6em;
	box-shadow: rgba(0, 0, 0, 0.8) 0 0.2em 0.6em;
	background-image: none;
	background-color: #000
}

.x-panel.x-floating.x-floating-light,
.x-msgbox.x-floating-light,
.x-form.x-floating.x-floating-light {
	background-image: none;
	background-color: #007e66
}

.x-panel.x-floating .x-panel-inner,
.x-panel.x-floating>.x-body,
.x-msgbox .x-panel-inner,
.x-msgbox>.x-body,
.x-form.x-floating .x-panel-inner,
.x-form.x-floating>.x-body {
	-webkit-border-radius: 0.3em;
	-moz-border-radius: 0.3em;
	-ms-border-radius: 0.3em;
	-o-border-radius: 0.3em;
	border-radius: 0.3em
}

.x-webkit .x-anchor {
	position: absolute;
	overflow: hidden
}

.x-webkit .x-anchor.x-anchor-top {
	margin-top: -0.68em;
	margin-left: -0.816em;
	width: 1.631em;
	height: 0.7em;
	-webkit-mask: 0 0 url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACMAAAAPCAYAAABut3YUAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAPZJREFUeNpi/PX7LwOFwAyIG6HseiA+Ra5BjBQ6xg+IVwAxJ5T/HYgjgHgTOYYxUeCQUiBeh+QQBih7HVSOLiHDDMSTgTiTgLrpQJwLxH9p5RhOaLT4EakeFF3RQPyF2o6RhkaBGYkheRmIPYH4KbXSjC4QnyTDIch6danhGCcgPgwNGXKBNNQMb0ocEwXE24GYn4FyADJjI76Ej88x7UC8FIjZGKgHQDlxGtRsZmISMMjy+dBQoSXYBC0gv+NyDD80xzgx0AeAqg4fIH6NHk0qQHyMjg6B1WvHYDkNFjIgwS1ALMowMOAjEAeBHINe2Q0U+AUQYACQ10C2QNhRogAAAABJRU5ErkJggg==') no-repeat;
	-webkit-mask-size: 1.631em 0.7em;
	background-color: #000
}

.x-webkit .x-anchor.x-anchor-bottom {
	margin-left: -0.816em;
	width: 1.631em;
	height: 0.7em;
	-webkit-mask: 0 0 url('data:image/png;base64,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') no-repeat;
	-webkit-mask-size: 1.631em 0.7em;
	background-color: #000
}

.x-webkit .x-anchor.x-anchor-left {
	margin-left: -0.666em;
	margin-top: -0.35em;
	height: 1.631em;
	width: 0.7em;
	-webkit-mask: 0 0 url('data:image/png;base64,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') no-repeat;
	-webkit-mask-size: 0.7em 1.631em;
	background-color: #000
}

.x-webkit .x-anchor.x-anchor-right {
	margin-top: -0.35em;
	height: 1.631em;
	width: 0.7em;
	-webkit-mask: 0 0 url('data:image/png;base64,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') no-repeat;
	-webkit-mask-size: 0.7em 1.631em;
	background-color: #000
}

.x-floating.x-panel-light:after {
	background-color: #007e66
}

.x-sheet,
.x-picker,
.x-sheet-action {
	padding: 0.7em;
	border-top: 1px solid #000;
	background-image: none;
	background-color: rgba(0, 0, 0, 0.9);
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	-ms-border-radius: 0;
	-o-border-radius: 0;
	border-radius: 0
}

.x-sheet-inner>.x-button,
.x-sheet-action-inner>.x-button {
	margin-bottom: 0.5em
}

.x-sheet-inner>.x-button:last-child,
.x-sheet-action-inner>.x-button:last-child {
	margin-bottom: 0
}

.x-msgbox {
	margin: .5em;
	border: 0.15em solid #007e66;
	-webkit-box-shadow: rgba(0, 0, 0, 0.4) 0 0.1em 0.5em;
	-moz-box-shadow: rgba(0, 0, 0, 0.4) 0 0.1em 0.5em;
	box-shadow: rgba(0, 0, 0, 0.4) 0 0.1em 0.5em;
	-webkit-border-radius: 0.3em;
	-moz-border-radius: 0.3em;
	-ms-border-radius: 0.3em;
	-o-border-radius: 0.3em;
	border-radius: 0.3em
}

.x-msgbox .x-icon {
	margin: 0 0.8em 0 0.5em;
	background: #fff;
	-webkit-mask-size: 100%
}

.x-msgbox .x-msgbox-info {
	-webkit-mask-image: url('data:image/png;base64,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')
}

.x-msgbox .x-msgbox-warning {
	-webkit-mask-image: url('data:image/png;base64,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')
}

.x-msgbox .x-msgbox-question {
	-webkit-mask-image: url('data:image/png;base64,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')
}

.x-msgbox .x-msgbox-error {
	-webkit-mask-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAFGUlEQVRoBe2bzW8VVRxAeS0UMZggaARtGgtNU5pIRCMaEsPChrgh7FhCjHtdEBKNLvwjdOHShSHGmEiMiVFw4cL4EcFoolRSuqBiRDQqCLRS6znDzPP1dub1fbbzLv6S05m57829vzN3Pu+8VhYWFtZ0KyqVygbqHoA74QEYhnmojX4WpuFHuAZz5HSdaVei0mlhJBW7Hx6GJ+AheAwaiS/50rfwGXwNF8nPDdGx6JgwonvJ6hE4CI/DXdBOXGHlz+EEnEb803Yqq65rD7cDFSn4NvwKHh/dwLpt42A7ubpuS7I03Ad74C24DP9AN0Rr67QN27JN2+5rRb5pYRraBC+Bx9ZKiNZKO2+bM/AKbG5WuilhGtgNb4Jn0zCRlV42B3PZ3Yx0w8JUfAQmwcvKSssVtWcu5nSkUemGhKnwKFyE1diFi2SzcnMyt6ONSNcVphJvCl4ATxZZA2WdmqO59tcTLxRmRc/Ez8AvUFbJMC9zNefCM3g9YW8kvocyHbOhYLhsrua8t6iXc4VZYRQ+hJsQVlr2ZXM299E86SXCfNEb/tfhTyi7XFF+5q7DhlB6kTBfqMCzMA1FlfVKuQ66JM8LmXgoPM4XTsIs9IpYUZ466DKeyTr1TJwETztegg7BLhhICnv7jw66HErdEpuqMEvb4Um4O/kkjj+66KRbEokwW2AtS/tgBzgfS+ii077UsbpL30fhBNwLsYVOuum4pg9zz8xj4P7u2FNsoZNuY7q6S3twPwUx9i5aSeim44DC68CxKB/sYw3ddFyn8BBsg5hOVugsCt10HFJ4BGLuXfSS0HFE80HYmBQt/XOdIseJfwfvaDzBlTGy3JRyHNzngTB0HFR4KxSdnS/w2ctwFhxZKHO4t3q1eRV82gtDx60Kb4E7wk/T5d+YTnIPqnjpI73EmnNe6LjFrVJvN3VXya7VeZWUpiyV1ceciyK5Dhd9GGW5W+S2iv+Fg+72eKh3TARfX/XFZfO1h+eg6JLjbec8Z+nSS6c5/k2+/ZAXOs55WboEvqfJu/nYTvlznAHPM3UItMxh5w3BgwVJ6nhJYa+xVyFP2Gv0MYghdLzgVpmCP2IwWsZBxymFz8FlKP1xSo6thm46nlPYrp6EvyDW0E3HqwrPwinwRVSsoZuOs75l83R9Bn4G52MLnXQ7o6s9bMzAR+B+HlvopJuOt4ZpMb/CvF3ulogtdDqVOlbHpZX8DnzQd5QjltBFJ92SyHZpX6p5YB+HH2A++bS3/+igy/HULbGpCqdu7zP9BLxU9XrooItO/wX24SvTnXz6MXgjnj199NrU3HXYucQvLHCZOAzT0GuiWb7mfjjXLbfw1qD886zUiz97MGdzX5vrlldoGbEZ3gAfq7ItV/apuZpz4W8wFx2/oTwrOkh/Am5A2WXN0VwHQ4/a5brCaU+PUMm7UGZpczPHkVq5vPllhWuk3ymptLLmtqxs4pK3FfLKqND3Ni+Ct2rekK/2Lm4O5mJOm/JyzitrqIezFal4PTwNp+EmrJa0bZuDuazP8mtk2pRwViGNDMNr4BPISva2bdmmbQ9n+TQzbUk4a4BGJ8Azo/fh3RS3btuwrYms/Vambf8bD0O4jgM/CgfAXcyfFoT36BS1FIq6634A78FXSLb1YNO2MEkkgbiD9l63x2E/2Ptj0Ky8kmfhJPirWB/tZhD1/rjt6JhwbSbIe3LzBfQ22AV7YAfck+K8MQWOSIjzX8A38BNcQ9Lxto7Gv+RtOqJ9fOwKAAAAAElFTkSuQmCC')
}

.x-msgbox .x-title {
	font-size: .9em;
	line-height: 1.4em
}

.x-msgbox .x-body {
	background: transparent !important
}

.x-msgbox .x-toolbar {
	background: transparent none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none
}

.x-msgbox .x-toolbar.x-docked-top {
	height: 1.3em
}

.x-msgbox .x-field {
	min-height: 2em;
	background: #fff;
	-webkit-border-radius: 0.2em;
	-moz-border-radius: 0.2em;
	-ms-border-radius: 0.2em;
	-o-border-radius: 0.2em;
	border-radius: 0.2em
}

.x-msgbox .x-form-field {
	min-height: 1.5em;
	padding-right: 0 !important;
	-webkit-appearance: none
}

.x-msgbox .x-field-input {
	padding-right: 2.2em
}

.x-msgbox-text {
	padding: 6px 0;
	line-height: 1.4em
}

.x-msgbox-buttons {
	padding: 0.4em 0;
	height: auto
}

.x-msgbox-buttons .x-button-normal span {
	opacity: .7
}

.x-msgbox-dark .x-msgbox-text {
	color: rgba(153, 255, 236, 0.9);
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0
}

.x-msgbox-dark .x-msgbox-input {
	background-image: none;
	background-color: rgba(153, 255, 236, 0.9);
	background-image: -webkit-linear-gradient(top, rgba(102, 255, 226, 0.9), rgba(128, 255, 231, 0.9) 10%, rgba(153, 255, 236, 0.9) 65%, rgba(156, 255, 236, 0.9));
	background-image: -moz-linear-gradient(top, rgba(102, 255, 226, 0.9), rgba(128, 255, 231, 0.9) 10%, rgba(153, 255, 236, 0.9) 65%, rgba(156, 255, 236, 0.9));
	background-image: -o-linear-gradient(top, rgba(102, 255, 226, 0.9), rgba(128, 255, 231, 0.9) 10%, rgba(153, 255, 236, 0.9) 65%, rgba(156, 255, 236, 0.9));
	background-image: -ms-linear-gradient(top, rgba(102, 255, 226, 0.9), rgba(128, 255, 231, 0.9) 10%, rgba(153, 255, 236, 0.9) 65%, rgba(156, 255, 236, 0.9));
	border: 0.1em solid rgba(0, 204, 165, 0.9)
}

.x-toolbar {
	padding: 0 0.2em
}

.x-toolbar.x-docked-left {
	width: 7em;
	padding: 0.2em
}

.x-toolbar.x-docked-right {
	width: 7em;
	padding: 0.2em
}

.x-title {
	line-height: 2.1em;
	font-size: 1.2em;
	margin: 0 0.3em;
	padding: 0 .3em
}

.x-toolbar-dark {
	background-image: none;
	background-color: #004b3d;
	border-color: #000
}

.x-toolbar-dark .x-title {
	color: #feffff;
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0
}

.x-toolbar-dark.x-docked-top {
	border-bottom-color: #000
}

.x-toolbar-dark.x-docked-bottom {
	border-top-color: #000
}

.x-toolbar-dark.x-docked-left {
	border-right-color: #000
}

.x-toolbar-dark.x-docked-right {
	border-left-color: #000
}

.x-toolbar-dark .x-button,
.x-toolbar .x-toolbar-dark .x-button,
.x-toolbar-dark .x-field-select .x-component-outer,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer {
	border: 1px solid #000;
	border-top-color: #000;
	background-color: #003228;
	color: #e4fffa
}

.x-toolbar-dark .x-button.x-button-back:before,
.x-toolbar-dark .x-button.x-button-forward:before,
.x-toolbar .x-toolbar-dark .x-button.x-button-back:before,
.x-toolbar .x-toolbar-dark .x-button.x-button-forward:before,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-back:before,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-forward:before,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-back:before,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-forward:before {
	background: #000
}

.x-toolbar-dark .x-button,
.x-toolbar-dark .x-button.x-button-back:after,
.x-toolbar-dark .x-button.x-button-forward:after,
.x-toolbar .x-toolbar-dark .x-button,
.x-toolbar .x-toolbar-dark .x-button.x-button-back:after,
.x-toolbar .x-toolbar-dark .x-button.x-button-forward:after,
.x-toolbar-dark .x-field-select .x-component-outer,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-back:after,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-forward:after,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-back:after,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-forward:after {
	background-image: none;
	background-color: #003228
}

.x-toolbar-dark .x-button.x-button-pressing,
.x-toolbar-dark .x-button.x-button-pressing:after,
.x-toolbar-dark .x-button.x-button-pressed,
.x-toolbar-dark .x-button.x-button-pressed:after,
.x-toolbar-dark .x-button.x-button-active,
.x-toolbar-dark .x-button.x-button-active:after,
.x-toolbar .x-toolbar-dark .x-button.x-button-pressing,
.x-toolbar .x-toolbar-dark .x-button.x-button-pressing:after,
.x-toolbar .x-toolbar-dark .x-button.x-button-pressed,
.x-toolbar .x-toolbar-dark .x-button.x-button-pressed:after,
.x-toolbar .x-toolbar-dark .x-button.x-button-active,
.x-toolbar .x-toolbar-dark .x-button.x-button-active:after,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-pressing,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-pressing:after,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-pressed,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-pressed:after,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-active,
.x-toolbar-dark .x-field-select .x-component-outer.x-button-active:after,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-pressing,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-pressing:after,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-pressed,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-pressed:after,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-active,
.x-toolbar .x-toolbar-dark .x-field-select .x-component-outer.x-button-active:after {
	background-image: none;
	background-color: #00221c;
	background-image: -webkit-linear-gradient(top, #000000, #000907 10%, #00221c 65%, #00251e);
	background-image: -moz-linear-gradient(top, #000000, #000907 10%, #00221c 65%, #00251e);
	background-image: -o-linear-gradient(top, #000000, #000907 10%, #00221c 65%, #00251e);
	background-image: -ms-linear-gradient(top, #000000, #000907 10%, #00221c 65%, #00251e)
}

.x-toolbar-dark .x-label,
.x-toolbar-dark .x-form-label {
	font-weight: bold;
	color: #feffff;
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0
}

.x-toolbar-light {
	background-image: none;
	background-color: #007e66;
	border-color: #000
}

.x-toolbar-light .x-title {
	color: #fff;
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0
}

.x-toolbar-light.x-docked-top {
	border-bottom-color: #000
}

.x-toolbar-light.x-docked-bottom {
	border-top-color: #000
}

.x-toolbar-light.x-docked-left {
	border-right-color: #000
}

.x-toolbar-light.x-docked-right {
	border-left-color: #000
}

.x-toolbar-light .x-button,
.x-toolbar .x-toolbar-light .x-button,
.x-toolbar-light .x-field-select .x-component-outer,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer {
	border: 1px solid #000;
	border-top-color: #001813;
	background-color: #006551;
	color: #fff
}

.x-toolbar-light .x-button.x-button-back:before,
.x-toolbar-light .x-button.x-button-forward:before,
.x-toolbar .x-toolbar-light .x-button.x-button-back:before,
.x-toolbar .x-toolbar-light .x-button.x-button-forward:before,
.x-toolbar-light .x-field-select .x-component-outer.x-button-back:before,
.x-toolbar-light .x-field-select .x-component-outer.x-button-forward:before,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-back:before,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-forward:before {
	background: #000
}

.x-toolbar-light .x-button,
.x-toolbar-light .x-button.x-button-back:after,
.x-toolbar-light .x-button.x-button-forward:after,
.x-toolbar .x-toolbar-light .x-button,
.x-toolbar .x-toolbar-light .x-button.x-button-back:after,
.x-toolbar .x-toolbar-light .x-button.x-button-forward:after,
.x-toolbar-light .x-field-select .x-component-outer,
.x-toolbar-light .x-field-select .x-component-outer.x-button-back:after,
.x-toolbar-light .x-field-select .x-component-outer.x-button-forward:after,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-back:after,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-forward:after {
	background-image: none;
	background-color: #006551
}

.x-toolbar-light .x-button.x-button-pressing,
.x-toolbar-light .x-button.x-button-pressing:after,
.x-toolbar-light .x-button.x-button-pressed,
.x-toolbar-light .x-button.x-button-pressed:after,
.x-toolbar-light .x-button.x-button-active,
.x-toolbar-light .x-button.x-button-active:after,
.x-toolbar .x-toolbar-light .x-button.x-button-pressing,
.x-toolbar .x-toolbar-light .x-button.x-button-pressing:after,
.x-toolbar .x-toolbar-light .x-button.x-button-pressed,
.x-toolbar .x-toolbar-light .x-button.x-button-pressed:after,
.x-toolbar .x-toolbar-light .x-button.x-button-active,
.x-toolbar .x-toolbar-light .x-button.x-button-active:after,
.x-toolbar-light .x-field-select .x-component-outer.x-button-pressing,
.x-toolbar-light .x-field-select .x-component-outer.x-button-pressing:after,
.x-toolbar-light .x-field-select .x-component-outer.x-button-pressed,
.x-toolbar-light .x-field-select .x-component-outer.x-button-pressed:after,
.x-toolbar-light .x-field-select .x-component-outer.x-button-active,
.x-toolbar-light .x-field-select .x-component-outer.x-button-active:after,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-pressing,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-pressing:after,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-pressed,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-pressed:after,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-active,
.x-toolbar .x-toolbar-light .x-field-select .x-component-outer.x-button-active:after {
	background-image: none;
	background-color: #005545;
	background-image: -webkit-linear-gradient(top, #00221c, #003c30 10%, #005545 65%, #005847);
	background-image: -moz-linear-gradient(top, #00221c, #003c30 10%, #005545 65%, #005847);
	background-image: -o-linear-gradient(top, #00221c, #003c30 10%, #005545 65%, #005847);
	background-image: -ms-linear-gradient(top, #00221c, #003c30 10%, #005545 65%, #005847)
}

.x-toolbar-light .x-label,
.x-toolbar-light .x-form-label {
	font-weight: bold;
	color: #fff;
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0
}

.x-toolbar-neutral {
	background-image: none;
	background-color: #e0e0e0;
	border-color: #616161
}

.x-toolbar-neutral .x-title {
	color: #070707;
	text-shadow: rgba(255, 255, 255, 0.25) 0 0.08em 0
}

.x-toolbar-neutral.x-docked-top {
	border-bottom-color: #616161
}

.x-toolbar-neutral.x-docked-bottom {
	border-top-color: #616161
}

.x-toolbar-neutral.x-docked-left {
	border-right-color: #616161
}

.x-toolbar-neutral.x-docked-right {
	border-left-color: #616161
}

.x-toolbar-neutral .x-button,
.x-toolbar .x-toolbar-neutral .x-button,
.x-toolbar-neutral .x-field-select .x-component-outer,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer {
	border: 1px solid #a0a0a0;
	border-top-color: #adadad;
	background-color: #d3d3d3;
	color: #000
}

.x-toolbar-neutral .x-button.x-button-back:before,
.x-toolbar-neutral .x-button.x-button-forward:before,
.x-toolbar .x-toolbar-neutral .x-button.x-button-back:before,
.x-toolbar .x-toolbar-neutral .x-button.x-button-forward:before,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-back:before,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-forward:before,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-back:before,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-forward:before {
	background: #a0a0a0
}

.x-toolbar-neutral .x-button,
.x-toolbar-neutral .x-button.x-button-back:after,
.x-toolbar-neutral .x-button.x-button-forward:after,
.x-toolbar .x-toolbar-neutral .x-button,
.x-toolbar .x-toolbar-neutral .x-button.x-button-back:after,
.x-toolbar .x-toolbar-neutral .x-button.x-button-forward:after,
.x-toolbar-neutral .x-field-select .x-component-outer,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-back:after,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-forward:after,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-back:after,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-forward:after {
	background-image: none;
	background-color: #d3d3d3
}

.x-toolbar-neutral .x-button.x-button-pressing,
.x-toolbar-neutral .x-button.x-button-pressing:after,
.x-toolbar-neutral .x-button.x-button-pressed,
.x-toolbar-neutral .x-button.x-button-pressed:after,
.x-toolbar-neutral .x-button.x-button-active,
.x-toolbar-neutral .x-button.x-button-active:after,
.x-toolbar .x-toolbar-neutral .x-button.x-button-pressing,
.x-toolbar .x-toolbar-neutral .x-button.x-button-pressing:after,
.x-toolbar .x-toolbar-neutral .x-button.x-button-pressed,
.x-toolbar .x-toolbar-neutral .x-button.x-button-pressed:after,
.x-toolbar .x-toolbar-neutral .x-button.x-button-active,
.x-toolbar .x-toolbar-neutral .x-button.x-button-active:after,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-pressing,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-pressing:after,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-pressed,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-pressed:after,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-active,
.x-toolbar-neutral .x-field-select .x-component-outer.x-button-active:after,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-pressing,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-pressing:after,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-pressed,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-pressed:after,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-active,
.x-toolbar .x-toolbar-neutral .x-field-select .x-component-outer.x-button-active:after {
	background-image: none;
	background-color: #ccc;
	background-image: -webkit-linear-gradient(top, #b2b2b2, #bfbfbf 10%, #cccccc 65%, #cdcdcd);
	background-image: -moz-linear-gradient(top, #b2b2b2, #bfbfbf 10%, #cccccc 65%, #cdcdcd);
	background-image: -o-linear-gradient(top, #b2b2b2, #bfbfbf 10%, #cccccc 65%, #cdcdcd);
	background-image: -ms-linear-gradient(top, #b2b2b2, #bfbfbf 10%, #cccccc 65%, #cdcdcd)
}

.x-toolbar-neutral .x-label,
.x-toolbar-neutral .x-form-label {
	font-weight: bold;
	color: #070707;
	text-shadow: rgba(255, 255, 255, 0.25) 0 0.08em 0
}

.x-toolbar.x-toolbar-neutral .x-toolbar-inner .x-button.x-button-pressing {
	background-image: -webkit-radial-gradient(rgba(0, 253, 205, 0.7), rgba(0, 253, 205, 0) 24px);
	background-image: -moz-radial-gradient(rgba(0, 253, 205, 0.7), rgba(0, 253, 205, 0) 24px);
	background-image: -o-radial-gradient(rgba(0, 253, 205, 0.7), rgba(0, 253, 205, 0) 24px);
	background-image: -ms-radial-gradient(rgba(0, 253, 205, 0.7), rgba(0, 253, 205, 0) 24px)
}

.x-toolbar.x-toolbar-neutral .x-toolbar-inner .x-button.x-button-pressing .x-button-icon.x-button-mask {
	background-image: none;
	background-color: #fff;
	background-image: -webkit-linear-gradient(top, #e6e6e6, #f2f2f2 10%, #ffffff 65%, #ffffff);
	background-image: -moz-linear-gradient(top, #e6e6e6, #f2f2f2 10%, #ffffff 65%, #ffffff);
	background-image: -o-linear-gradient(top, #e6e6e6, #f2f2f2 10%, #ffffff 65%, #ffffff);
	background-image: -ms-linear-gradient(top, #e6e6e6, #f2f2f2 10%, #ffffff 65%, #ffffff)
}

.x-spinner .x-input-el,
.x-field-select .x-input-el {
	-webkit-text-fill-color: #000;
	-webkit-opacity: 1
}

.x-spinner.x-item-disabled .x-input-el,
.x-field-select.x-item-disabled .x-input-el {
	-webkit-text-fill-color: currentcolor
}

.x-toolbar .x-field-select .x-input-el {
	-webkit-text-fill-color: #fff
}

.x-toolbar .x-field-select.x-item-disabled .x-input-el {
	-webkit-text-fill-color: rgba(255, 255, 255, 0.6)
}

.x-toolbar .x-form-field-container {
	padding: 0 .3em
}

.x-toolbar .x-slider-field .x-component-outer,
.x-toolbar .x-toggle-field .x-component-outer {
	padding: 0em .3em
}

.x-toolbar .x-field {
	width: 13em;
	padding: .5em;
	min-height: 0;
	border-bottom: 0;
	background: transparent
}

.x-toolbar .x-field .x-clear-icon {
	background-size: 50% 50%;
	right: -0.8em;
	margin-top: -1.06em
}

.x-toolbar .x-field-input {
	padding-right: 1.6em !important
}

.x-toolbar .x-field-textarea .x-component-outer,
.x-toolbar .x-field-text .x-component-outer,
.x-toolbar .x-field-number .x-component-outer,
.x-toolbar .x-field-search .x-component-outer {
	background-color: #fff;
	-webkit-border-radius: 0.3em;
	-moz-border-radius: 0.3em;
	-ms-border-radius: 0.3em;
	-o-border-radius: 0.3em;
	border-radius: 0.3em;
	-webkit-box-shadow: rgba(0, 0, 0, 0.5) 0 0.1em 0 inset, rgba(0, 0, 0, 0.5) 0 -0.1em 0 inset, rgba(0, 0, 0, 0.5) 0.1em 0 0 inset, rgba(0, 0, 0, 0.5) -0.1em 0 0 inset, rgba(0, 0, 0, 0.5) 0 0.15em 0.4em inset;
	-moz-box-shadow: rgba(0, 0, 0, 0.5) 0 0.1em 0 inset, rgba(0, 0, 0, 0.5) 0 -0.1em 0 inset, rgba(0, 0, 0, 0.5) 0.1em 0 0 inset, rgba(0, 0, 0, 0.5) -0.1em 0 0 inset, rgba(0, 0, 0, 0.5) 0 0.15em 0.4em inset;
	box-shadow: rgba(0, 0, 0, 0.5) 0 0.1em 0 inset, rgba(0, 0, 0, 0.5) 0 -0.1em 0 inset, rgba(0, 0, 0, 0.5) 0.1em 0 0 inset, rgba(0, 0, 0, 0.5) -0.1em 0 0 inset, rgba(0, 0, 0, 0.5) 0 0.15em 0.4em inset
}

.x-toolbar .x-form-label {
	background: transparent;
	border: 0;
	padding: 0;
	line-height: 1.4em
}

.x-toolbar .x-form-field {
	height: 1.6em;
	color: #6e6e6e;
	background: transparent;
	min-height: 0;
	-webkit-appearance: none;
	padding: 0em .3em;
	margin: 0
}

.x-toolbar .x-form-field:focus {
	color: #000
}

.x-toolbar .x-field-select .x-component-outer,
.x-toolbar .x-field-search .x-component-outer {
	-webkit-border-radius: 0.8em;
	-moz-border-radius: 0.8em;
	-ms-border-radius: 0.8em;
	-o-border-radius: 0.8em;
	border-radius: 0.8em
}

.x-toolbar .x-field-search .x-field-input {
	background-position: .5em 50%
}

.x-toolbar .x-field-select {
	-webkit-box-shadow: none
}

.x-toolbar .x-field-select .x-form-field {
	height: 1.4em
}

.x-toolbar .x-field-select {
	background: transparent
}

.x-toolbar .x-field-select .x-component-outer:after {
	right: .4em
}

.x-toolbar .x-field-select.x-item-disabled .x-component-outer:after {
	opacity: .6
}

.x-toolbar .x-field-select .x-component-outer:before {
	width: 3em;
	border-left: none;
	-moz-border-radius-topright: 0.8em;
	-webkit-border-top-right-radius: 0.8em;
	border-top-right-radius: 0.8em;
	-moz-border-radius-bottomright: 0.8em;
	-webkit-border-bottom-right-radius: 0.8em;
	border-bottom-right-radius: 0.8em;
	-webkit-mask: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAABCAYAAACc0f2yAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAADJJREFUeNpi/P//PwMjIyMbAwMDOxRzAjEXFHMDMQ8a5kXC6HLcSHo5kcwEmU9TABBgAOcTBAFcRiSpAAAAAElFTkSuQmCC');
	-webkit-mask-position: right top;
	-webkit-mask-repeat: repeat-y;
	-webkit-mask-size: 3em 0.05em
}

.x-toolbar .x-field-select .x-input-text {
	color: #fff
}

.x-android .x-field-search .x-field-input {
	padding-left: .2em !important;
	padding-right: 2.2em !important
}

.x-toast {
	margin: .5em;
	border: 0.15em solid #007e66;
	-webkit-box-shadow: rgba(0, 0, 0, 0.4) 0 0.1em 0.5em;
	-moz-box-shadow: rgba(0, 0, 0, 0.4) 0 0.1em 0.5em;
	box-shadow: rgba(0, 0, 0, 0.4) 0 0.1em 0.5em;
	-webkit-border-radius: 0.3em;
	-moz-border-radius: 0.3em;
	-ms-border-radius: 0.3em;
	-o-border-radius: 0.3em;
	border-radius: 0.3em
}

.x-toast .x-toast-text {
	padding: 6px 0;
	line-height: 1.4em
}

.x-msgbox-dark .x-msgbox-text {
	color: rgba(153, 255, 236, 0.9);
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0
}

.x-msgbox-dark .x-msgbox-input {
	background-image: none;
	background-color: rgba(153, 255, 236, 0.9);
	background-image: -webkit-linear-gradient(top, rgba(102, 255, 226, 0.9), rgba(128, 255, 231, 0.9) 10%, rgba(153, 255, 236, 0.9) 65%, rgba(156, 255, 236, 0.9));
	background-image: -moz-linear-gradient(top, rgba(102, 255, 226, 0.9), rgba(128, 255, 231, 0.9) 10%, rgba(153, 255, 236, 0.9) 65%, rgba(156, 255, 236, 0.9));
	background-image: -o-linear-gradient(top, rgba(102, 255, 226, 0.9), rgba(128, 255, 231, 0.9) 10%, rgba(153, 255, 236, 0.9) 65%, rgba(156, 255, 236, 0.9));
	background-image: -ms-linear-gradient(top, rgba(102, 255, 226, 0.9), rgba(128, 255, 231, 0.9) 10%, rgba(153, 255, 236, 0.9) 65%, rgba(156, 255, 236, 0.9));
	border: 0.1em solid rgba(0, 204, 165, 0.9)
}

.x-menu {
	padding: 0.7em;
	background-image: none;
	background-color: rgba(0, 0, 0, 0.9)
}

.x-menu .x-button {
	margin-bottom: 0.7em
}

.x-menu .x-button:last-child {
	margin-bottom: 0
}

.x-carousel-indicator span {
	width: 0.5em;
	height: 0.5em;
	-webkit-border-radius: 0.25em;
	-moz-border-radius: 0.25em;
	-ms-border-radius: 0.25em;
	-o-border-radius: 0.25em;
	border-radius: 0.25em;
	margin: 0.2em
}

.x-carousel-indicator-horizontal {
	height: 1.5em
}

.x-carousel-indicator-vertical {
	width: 1.5em
}

.x-carousel-indicator-light span {
	background-image: none;
	background-color: rgba(255, 255, 255, 0.1)
}

.x-carousel-indicator-light span.x-carousel-indicator-active {
	background-image: none;
	background-color: rgba(255, 255, 255, 0.3)
}

.x-carousel-indicator-dark span {
	background-image: none;
	background-color: rgba(0, 0, 0, 0.1)
}

.x-carousel-indicator-dark span.x-carousel-indicator-active {
	background-image: none;
	background-color: rgba(0, 0, 0, 0.3)
}

.x-form .x-scroll-container {
	background-color: #eee
}

.x-form .x-toolbar .x-scroll-container {
	background-color: transparent
}

.x-form-label {
	text-shadow: #fff 0 1px 1px;
	color: #333;
	text-shadow: rgba(255, 255, 255, 0.25) 0 0.08em 0;
	padding: 0.6em;
	background-color: #f7f7f7;
	color: #080808
}

.x-form-label span {
	font-size: .8em
}

.x-form-fieldset {
	margin: .5em .5em 1.5em
}

.x-form-fieldset .x-form-label {
	border-top: 1px solid #fff
}

.x-form-fieldset .x-form-fieldset-inner {
	border: 1px solid #ddd;
	background: #fff;
	padding: 0;
	-webkit-border-radius: 0.4em;
	-moz-border-radius: 0.4em;
	-ms-border-radius: 0.4em;
	-o-border-radius: 0.4em;
	border-radius: 0.4em
}

.x-form-fieldset .x-field {
	border-bottom: 1px solid #ddd;
	background: transparent
}

.x-form-fieldset .x-field:first-child {
	-moz-border-radius-topleft: 0.4em;
	-webkit-border-top-left-radius: 0.4em;
	border-top-left-radius: 0.4em;
	-moz-border-radius-topright: 0.4em;
	-webkit-border-top-right-radius: 0.4em;
	border-top-right-radius: 0.4em
}

.x-form-fieldset .x-field:last-child {
	border-bottom: 0;
	-moz-border-radius-bottomleft: 0.4em;
	-webkit-border-bottom-left-radius: 0.4em;
	border-bottom-left-radius: 0.4em;
	-moz-border-radius-bottomright: 0.4em;
	-webkit-border-bottom-right-radius: 0.4em;
	border-bottom-right-radius: 0.4em
}

.x-form-fieldset-title {
	text-shadow: #fff 0 1px 1px;
	color: #333;
	margin: 1em 0.7em 0.3em;
	color: #333
}

.x-form-fieldset-instructions {
	text-shadow: #fff 0 1px 1px;
	color: #333;
	color: gray;
	margin: 1em 0.7em 0.3em;
	font-size: .8em
}

.x-label-align-left:first-child .x-form-label {
	-moz-border-radius-topleft: 0.4em;
	-webkit-border-top-left-radius: 0.4em;
	border-top-left-radius: 0.4em
}

.x-label-align-left:last-child .x-form-label {
	-moz-border-radius-bottomleft: 0.4em;
	-webkit-border-bottom-left-radius: 0.4em;
	border-bottom-left-radius: 0.4em
}

.x-label-align-right:first-child .x-form-label {
	-moz-border-radius-topright: 0.4em;
	-webkit-border-top-right-radius: 0.4em;
	border-top-right-radius: 0.4em
}

.x-label-align-right:last-child {
	border-bottom: 0
}

.x-label-align-right:last-child .x-form-label {
	-moz-border-radius-bottomright: 0.4em;
	-webkit-border-bottom-right-radius: 0.4em;
	border-bottom-right-radius: 0.4em
}

.x-label-align-top:first-child .x-form-label {
	-moz-border-radius-topleft: 0.4em;
	-webkit-border-top-left-radius: 0.4em;
	border-top-left-radius: 0.4em;
	-moz-border-radius-topright: 0.4em;
	-webkit-border-top-right-radius: 0.4em;
	border-top-right-radius: 0.4em
}

.x-label-align-bottom:last-child .x-form-label {
	-moz-border-radius-bottomleft: 0.4em;
	-webkit-border-bottom-left-radius: 0.4em;
	border-bottom-left-radius: 0.4em;
	-moz-border-radius-bottomright: 0.4em;
	-webkit-border-bottom-right-radius: 0.4em;
	border-bottom-right-radius: 0.4em
}

.x-field {
	min-height: 2.5em;
	background: #fff
}

.x-field:last-child {
	border-bottom: 0
}

.x-field-label {
	background-color: #f7f7f7;
	color: #080808
}

.x-field-input .x-clear-icon {
	background: url('data:image/png;base64,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') no-repeat;
	background-position: center center;
	background-size: 55% 55%;
	width: 2.2em;
	height: 2.2em;
	margin: .5em;
	margin-top: -1.1em;
	right: -0.5em
}

.x-field-clearable .x-field-input {
	padding-right: 2.2em
}

.x-input-el {
	padding: .4em;
	min-height: 2.5em;
	border-width: 0;
	-webkit-appearance: none
}

.x-ie .x-input-el {
	background: transparent
}

.x-item-disabled .x-form-label,
.x-item-disabled input,
.x-item-disabled .x-input-el,
.x-item-disabled .x-spinner-body,
.x-item-disabled select,
.x-item-disabled textarea,
.x-item-disabled .x-field-clear-container {
	color: #b3b3b3;
	pointer-events: none
}

.x-item-disabled .x-form-label {
	color: #aaa
}

.x-item-disabled .x-form-label:after {
	color: #666 !important
}

.x-checkmark-base,
.x-field-checkbox .x-field-mask::after,
.x-field-radio .x-field-mask::after,
.x-select-overlay .x-item-selected.x-list-item::after {
	position: absolute;
	top: 0;
	right: 10px;
	bottom: 0;
	content: '3';
	font-family: 'Pictos';
	font-size: 1.6em;
	text-align: right;
	line-height: 1.6em
}

.x-field-checkbox .x-field-mask::after,
.x-field-radio .x-field-mask::after {
	color: #ddd
}

.x-input-checkbox,
.x-input-radio {
	visibility: hidden
}

.x-input-el:checked+.x-field-mask::after {
	color: #ffc61e
}

.x-item-disabled.x-field-checkbox .x-input-checkbox:checked+.x-field-mask::after {
	color: #ead390
}

.x-field-radio .x-field-mask {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0
}

.x-field-radio .x-field-mask::after {
	content: '';
	position: absolute;
	width: 16px;
	height: 16px;
	top: 16px;
	left: auto;
	right: 16px;
	background-color: #d0d0d0;
	-webkit-border-radius: 16px;
	-moz-border-radius: 16px;
	-ms-border-radius: 16px;
	-o-border-radius: 16px;
	border-radius: 16px
}

.x-field-radio .x-field-mask::before {
	content: '';
	position: absolute;
	width: 26px;
	height: 26px;
	top: 11px;
	left: auto;
	right: 11px;
	background-color: #ddd;
	-webkit-border-radius: 26px;
	-moz-border-radius: 26px;
	-ms-border-radius: 26px;
	-o-border-radius: 26px;
	border-radius: 26px
}

.x-input-radio:checked+.x-field-mask::after {
	background: #ffc61e
}

.x-item-disabled.x-field-radio .x-input-radio:checked+.x-field-mask::after {
	background: #ead390
}

.x-field-search .x-field-input {
	position: relative
}

.x-field-search .x-field-input:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	text-align: center;
	font-family: "Pictos";
	content: "s"
}

.x-field-search .x-field-input:before {
	color: #ccc;
	top: .7em;
	left: .5em;
	font-size: 1.1em;
	right: auto
}

.x-toolbar .x-field-search .x-field-input:before {
	top: .3em
}

.x-field-search .x-field-input .x-form-field {
	margin-left: 1em
}

.x-webkit .x-selectmark-base,
.x-webkit .x-field-select .x-component-outer:after,
.x-field-select .x-webkit .x-component-outer:after {
	content: '';
	position: absolute;
	width: 1em;
	height: 1em;
	top: 50%;
	left: auto;
	right: 0.7em;
	-webkit-mask-size: 1em;
	-webkit-mask-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpGRTdGMTE3NDA3MjA2ODExOTJDQUMyNUQwRUE4NjdEQiIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDoxQTFBMDFDQ0I5NEYxMURGQUU1RjlGMEFERUNDQTVEMCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDoyMkRCMDIxMkI5NEUxMURGQUU1RjlGMEFERUNDQTVEMCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjMwRTE0QzVBNDIyMjY4MTFCQ0ZCOTAzOTcwNzcyRkVCIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOkZFN0YxMTc0MDcyMDY4MTE5MkNBQzI1RDBFQTg2N0RCIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+HfrH/AAAAeVJREFUeNrs2cFHBGEUAPA3zYqIiIhOnTpFRHSKrp26RqeuEV077R/QqWtE166dOkVERHRa9hQRnZalFcv0Hk/W1Mx+38z3vvlm5j3eZW+/9+abne+9KEkSaFPMQMtCwQpWsIIVrGAFK1jBClawgo2ik/4hiqJGwLKuvfpIc5xSkWqYr5hzU1s/mRNxXTPsJ+ZqluvXlwOmSj3XBDvG3M1rpAmYYoUrFzr4ZNqTawqm2MH8Dhh7ZXJUbcAUx4FinzBnJcAUl4FhP/jIgRSYKvkYCJaO2LbNv08RMMUy5nsA4COTLy0XYIqtil9iF6aflq7AwBWuAvuQ9ZKSBgNX2ieWjtKSzeXBNZgqfe8J+4W5aXtbcg0GrvibB/BhkeuhBJhigzsghT0veh+WAlMcCGHvMOMQwcCdcIntYy6WmXhIg2PuiAvsEHO97IhHGgzckb4D8L6LmZYPMHBnhiWwXVdDPF9g4A4Vwd66nFr6BAN3ygbbw1yoMzjmjplgB5hrrufSvsHAHesZDOD2JAbxVYCBOzfIAZ9JbR6qAgN3cPwP9kZy1VIlGLiTdluCmoOBO/pnS9Bk8DzmS3pL4BMcpZEe1qX0GI/atC4dQYXRMa1MU0IX4gpWsIIVrGAFK1jBCnYUPwIMAPUPAyFL+nRdAAAAAElFTkSuQmCC');
	margin-top: -0.5em
}

.x-field-select {
	position: relative;
	z-index: 1
}

.x-field-select .x-component-outer:after {
	z-index: 2;
	background-color: #ddd
}

.x-field-select .x-component-outer:before,
.x-field-select .x-component-outer:after {
	pointer-events: none;
	position: absolute;
	display: block
}

.x-select-overlay .x-list-item-label {
	height: 2.6em
}

.x-select-overlay .x-item-selected .x-list-label {
	margin-right: 2.6em
}

.x-select-overlay .x-item-selected.x-list-item::after {
	color: #ddd
}

.x-slider-field .x-component-outer,
.x-toggle-field .x-component-outer {
	padding: 0.6em
}

.x-spinner .x-field-input .x-input-el {
	-webkit-text-fill-color: #000
}

.x-spinner.x-item-disabled .x-input-el {
	-webkit-text-fill-color: #B3B3B3
}

.x-spinner.x-item-disabled .x-spinner-button {
	color: #aaa !important
}

.x-spinner.x-item-disabled .x-spinner-button,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button {
	border: 1px solid #c4c4c4;
	border-top-color: #d0d0d0;
	background-color: #f7f7f7;
	color: #1e1e1e
}

.x-spinner.x-item-disabled .x-spinner-button.x-button-back:before,
.x-spinner.x-item-disabled .x-spinner-button.x-button-forward:before,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-back:before,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-forward:before {
	background: #c4c4c4
}

.x-spinner.x-item-disabled .x-spinner-button,
.x-spinner.x-item-disabled .x-spinner-button.x-button-back:after,
.x-spinner.x-item-disabled .x-spinner-button.x-button-forward:after,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-back:after,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-forward:after {
	background-image: none;
	background-color: #f7f7f7;
	background-image: -webkit-linear-gradient(top, #ffffff, #ffffff 3%, #eaeaea);
	background-image: -moz-linear-gradient(top, #ffffff, #ffffff 3%, #eaeaea);
	background-image: -o-linear-gradient(top, #ffffff, #ffffff 3%, #eaeaea);
	background-image: -ms-linear-gradient(top, #ffffff, #ffffff 3%, #eaeaea)
}

.x-spinner.x-item-disabled .x-spinner-button.x-button-pressing,
.x-spinner.x-item-disabled .x-spinner-button.x-button-pressing:after,
.x-spinner.x-item-disabled .x-spinner-button.x-button-pressed,
.x-spinner.x-item-disabled .x-spinner-button.x-button-pressed:after,
.x-spinner.x-item-disabled .x-spinner-button.x-button-active,
.x-spinner.x-item-disabled .x-spinner-button.x-button-active:after,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-pressing,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-pressing:after,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-pressed,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-pressed:after,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-active,
.x-toolbar .x-spinner.x-item-disabled .x-spinner-button.x-button-active:after {
	background-image: none;
	background-color: #efefef;
	background-image: -webkit-linear-gradient(top, #d5d5d5, #e2e2e2 10%, #efefef 65%, #f0f0f0);
	background-image: -moz-linear-gradient(top, #d5d5d5, #e2e2e2 10%, #efefef 65%, #f0f0f0);
	background-image: -o-linear-gradient(top, #d5d5d5, #e2e2e2 10%, #efefef 65%, #f0f0f0);
	background-image: -ms-linear-gradient(top, #d5d5d5, #e2e2e2 10%, #efefef 65%, #f0f0f0)
}

.x-spinner .x-spinner-button {
	margin-top: .25em;
	margin-bottom: .25em;
	width: 2em;
	padding: .23em 0 .27em;
	font-weight: bold;
	text-align: center;
	border: 1px solid #ddd !important;
	-webkit-border-radius: 1em;
	-moz-border-radius: 1em;
	-ms-border-radius: 1em;
	-o-border-radius: 1em;
	border-radius: 1em
}

.x-spinner .x-spinner-button,
.x-toolbar .x-spinner .x-spinner-button {
	border: 1px solid #b7b7b7;
	border-top-color: #c4c4c4;
	background-color: #eaeaea;
	color: #111
}

.x-spinner .x-spinner-button.x-button-back:before,
.x-spinner .x-spinner-button.x-button-forward:before,
.x-toolbar .x-spinner .x-spinner-button.x-button-back:before,
.x-toolbar .x-spinner .x-spinner-button.x-button-forward:before {
	background: #b7b7b7
}

.x-spinner .x-spinner-button,
.x-spinner .x-spinner-button.x-button-back:after,
.x-spinner .x-spinner-button.x-button-forward:after,
.x-toolbar .x-spinner .x-spinner-button,
.x-toolbar .x-spinner .x-spinner-button.x-button-back:after,
.x-toolbar .x-spinner .x-spinner-button.x-button-forward:after {
	background-image: none;
	background-color: #eaeaea;
	background-image: -webkit-linear-gradient(top, #ffffff, #f7f7f7 3%, #dddddd);
	background-image: -moz-linear-gradient(top, #ffffff, #f7f7f7 3%, #dddddd);
	background-image: -o-linear-gradient(top, #ffffff, #f7f7f7 3%, #dddddd);
	background-image: -ms-linear-gradient(top, #ffffff, #f7f7f7 3%, #dddddd)
}

.x-spinner .x-spinner-button.x-button-pressing,
.x-spinner .x-spinner-button.x-button-pressing:after,
.x-spinner .x-spinner-button.x-button-pressed,
.x-spinner .x-spinner-button.x-button-pressed:after,
.x-spinner .x-spinner-button.x-button-active,
.x-spinner .x-spinner-button.x-button-active:after,
.x-toolbar .x-spinner .x-spinner-button.x-button-pressing,
.x-toolbar .x-spinner .x-spinner-button.x-button-pressing:after,
.x-toolbar .x-spinner .x-spinner-button.x-button-pressed,
.x-toolbar .x-spinner .x-spinner-button.x-button-pressed:after,
.x-toolbar .x-spinner .x-spinner-button.x-button-active,
.x-toolbar .x-spinner .x-spinner-button.x-button-active:after {
	background-image: none;
	background-color: #e2e2e2;
	background-image: -webkit-linear-gradient(top, #c9c9c9, #d5d5d5 10%, #e2e2e2 65%, #e3e3e3);
	background-image: -moz-linear-gradient(top, #c9c9c9, #d5d5d5 10%, #e2e2e2 65%, #e3e3e3);
	background-image: -o-linear-gradient(top, #c9c9c9, #d5d5d5 10%, #e2e2e2 65%, #e3e3e3);
	background-image: -ms-linear-gradient(top, #c9c9c9, #d5d5d5 10%, #e2e2e2 65%, #e3e3e3)
}

.x-spinner .x-spinner-button-down {
	margin-left: .25em
}

.x-spinner .x-spinner-button-up {
	margin-right: .25em
}

.x-spinner.x-field-grouped-buttons .x-spinner-button-down {
	margin-right: .5em
}

.x-android .x-spinner-button {
	padding: .40em 0 .11em !important
}

.x-ie .x-spinner .x-field-input .x-input-el:disabled {
	color: #000
}

.x-field-textarea textarea {
	min-height: 6em;
	padding-top: .5em
}

.x-indexbar {
	padding: .3em 0;
	color: #013027
}

.x-indexbar-vertical {
	width: 1.1em;
	margin-right: 8px
}

.x-indexbar-horizontal {
	height: 1.1em;
	margin-bottom: 8px
}

.x-indexbar-pressed {
	-webkit-border-radius: 0.55em;
	-moz-border-radius: 0.55em;
	-ms-border-radius: 0.55em;
	-o-border-radius: 0.55em;
	border-radius: 0.55em;
	background-color: rgba(143, 163, 159, 0.8)
}

.x-list {
	background-color: #f7f7f7
}

.x-list .x-list-disclosure {
	position: relative;
	overflow: visible;
	border: 0;
	-webkit-border-radius: 32px;
	-moz-border-radius: 32px;
	-ms-border-radius: 32px;
	-o-border-radius: 32px;
	border-radius: 32px;
	background-image: none;
	background-color: #ffc61e;
	background-image: -webkit-linear-gradient(top, #ffd96a, #ffcc38 3%, #ffc004);
	background-image: -moz-linear-gradient(top, #ffd96a, #ffcc38 3%, #ffc004);
	background-image: -o-linear-gradient(top, #ffd96a, #ffcc38 3%, #ffc004);
	background-image: -ms-linear-gradient(top, #ffd96a, #ffcc38 3%, #ffc004);
	width: 32px;
	height: 32px;
	margin: 7px 7px 0 0
}

.x-list .x-list-disclosure:before {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	content: ']';
	font-family: 'Pictos';
	color: #fff;
	font-size: 24px;
	text-align: center;
	line-height: 35px;
	text-shadow: 0 0 0
}

.x-list.x-list-indexed .x-list-disclosure {
	margin-right: 1.8em
}

.x-list .x-item-selected .x-list-disclosure {
	background: #fff none
}

.x-list .x-item-selected .x-list-disclosure:before {
	color: #ffc61e
}

.x-list .x-list-item {
	color: #000
}

.x-list .x-list-item.x-item-selected .x-dock-horizontal,
.x-list .x-list-item.x-item-selected.x-list-item-tpl {
	background-image: none;
	background-color: #ffc61e;
	color: #000
}

.x-list .x-list-item.x-item-pressed.x-list-item-tpl,
.x-list .x-list-item.x-item-pressed .x-dock-horizontal {
	background: #fff none
}

.x-list .x-list-item .x-list-item-body,
.x-list .x-list-item.x-list-item-tpl .x-innerhtml {
	padding: 12px 15px
}

.x-list-normal .x-list-header {
	background-image: none;
	background-color: #00e4b9;
	color: #004b3d;
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0;
	border-top: 1px solid #00e4b9;
	border-bottom: 1px solid #007e66;
	font-weight: bold;
	font-size: 0.8em;
	padding: 0.2em 1.02em
}

.x-list-normal .x-list-item.x-list-item-tpl,
.x-list-normal .x-list-item .x-dock-horizontal {
	border-top: 1px solid #dedede
}

.x-list-normal .x-list-item.x-list-item-tpl.x-list-footer-wrap,
.x-list-normal .x-list-item.x-list-footer-wrap .x-dock-horizontal {
	border-bottom: 1px solid #dedede
}

.x-list-normal .x-list-item.x-item-pressed.x-list-item-tpl,
.x-list-normal .x-list-item.x-item-pressed .x-dock-horizontal {
	border-top-color: #fff;
	background-color: #fff
}

.x-list-normal .x-list-item.x-item-selected.x-list-item-tpl,
.x-list-normal .x-list-item.x-item-selected .x-dock-horizontal {
	border-top-color: #ffc61e
}

.x-list-round .x-scroll-view {
	background-color: #eee
}

.x-list-round .x-list-header-swap {
	padding-right: 13px
}

.x-list-round .x-list-inner .x-scroll-container {
	top: 13px;
	left: 13px;
	bottom: 13px;
	right: 13px;
	width: auto !important;
	height: auto !important
}

.x-list-round .x-list-header {
	color: #777;
	font-size: 1em;
	font-weight: bold;
	padding-left: 26px;
	line-height: 1.7em;
	background-image: -webkit-linear-gradient(top, #eeeeee, rgba(238, 238, 238, 0.9) 30%, rgba(238, 238, 238, 0.4));
	background-image: -moz-linear-gradient(top, #eeeeee, rgba(238, 238, 238, 0.9) 30%, rgba(238, 238, 238, 0.4));
	background-image: -o-linear-gradient(top, #eeeeee, rgba(238, 238, 238, 0.9) 30%, rgba(238, 238, 238, 0.4));
	background-image: -ms-linear-gradient(top, #eeeeee, rgba(238, 238, 238, 0.9) 30%, rgba(238, 238, 238, 0.4))
}

.x-list-round .x-list-container {
	padding: 13px 13px 0 13px
}

.x-list-round .x-list-container .x-list-header {
	padding-left: 13px;
	background-image: none
}

.x-list-round.x-list-ungrouped .x-list-item-tpl,
.x-list-round.x-list-ungrouped .x-list-item .x-dock-horizontal,
.x-list-round.x-list-grouped .x-list-item-tpl,
.x-list-round.x-list-grouped .x-list-item .x-dock-horizontal {
	border: 1px solid #dedede;
	border-width: 1px 1px 0 1px;
	background: #f7f7f7
}

.x-list-round.x-list-ungrouped .x-list-item-first {
	-moz-border-radius-topleft: 0.4em;
	-webkit-border-top-left-radius: 0.4em;
	border-top-left-radius: 0.4em;
	-moz-border-radius-topright: 0.4em;
	-webkit-border-top-right-radius: 0.4em;
	border-top-right-radius: 0.4em
}

.x-list-round.x-list-ungrouped .x-list-item-last {
	-moz-border-radius-bottomleft: 0.4em;
	-webkit-border-bottom-left-radius: 0.4em;
	border-bottom-left-radius: 0.4em;
	-moz-border-radius-bottomright: 0.4em;
	-webkit-border-bottom-right-radius: 0.4em;
	border-bottom-right-radius: 0.4em;
	border-width: 1px;
	margin-bottom: 13px
}

.x-list-round.x-list-grouped .x-list-header-wrap .x-dock-horizontal {
	-moz-border-radius-topleft: 0.4em;
	-webkit-border-top-left-radius: 0.4em;
	border-top-left-radius: 0.4em;
	-moz-border-radius-topright: 0.4em;
	-webkit-border-top-right-radius: 0.4em;
	border-top-right-radius: 0.4em
}

.x-list-round.x-list-grouped .x-list-header-wrap.x-list-header {
	border: 1px solid #dedede;
	border-width: 1px 1px 0 1px;
	-moz-border-radius-topleft: 0.4em;
	-webkit-border-top-left-radius: 0.4em;
	border-top-left-radius: 0.4em;
	-moz-border-radius-topright: 0.4em;
	-webkit-border-top-right-radius: 0.4em;
	border-top-right-radius: 0.4em
}

.x-list-round.x-list-grouped .x-list-footer-wrap {
	background: transparent
}

.x-list-round.x-list-grouped .x-list-footer-wrap.x-list-item-tpl,
.x-list-round.x-list-grouped .x-list-footer-wrap .x-dock-horizontal {
	border: none;
	background: transparent;
	padding-bottom: 13px;
	margin-bottom: 13px
}

.x-list-round.x-list-grouped .x-list-footer-wrap.x-list-item-tpl>.x-innerhtml,
.x-list-round.x-list-grouped .x-list-footer-wrap.x-list-item-tpl>.x-dock-body,
.x-list-round.x-list-grouped .x-list-footer-wrap .x-dock-horizontal>.x-innerhtml,
.x-list-round.x-list-grouped .x-list-footer-wrap .x-dock-horizontal>.x-dock-body {
	border: 1px solid #dedede;
	background: #f7f7f7;
	-moz-border-radius-bottomleft: 0.4em;
	-webkit-border-bottom-left-radius: 0.4em;
	border-bottom-left-radius: 0.4em;
	-moz-border-radius-bottomright: 0.4em;
	-webkit-border-bottom-right-radius: 0.4em;
	border-bottom-right-radius: 0.4em
}

.x-list-round.x-list-grouped .x-list-footer-wrap.x-item-pressed>.x-innerhtml,
.x-list-round.x-list-grouped .x-list-footer-wrap.x-item-pressed>.x-dock-body {
	background: #fff none
}

.x-list-round.x-list-grouped .x-list-footer-wrap.x-item-selected>.x-innerhtml,
.x-list-round.x-list-grouped .x-list-footer-wrap.x-item-selected>.x-dock-body {
	background-image: none;
	background-color: #ffc61e;
	color: #000
}

.x-list-round .x-indexbar-vertical {
	margin-right: 20px
}

.x-list-round .x-list-footer-wrap.x-list-item-last.x-list-item-odd.x-list-item.x-list-item-tpl {
	background-color: transparent !important
}

.x-list-round.x-list-grouped .x-list-item-odd.x-list-footer-wrap>.x-innerhtml,
.x-list-round.x-list-grouped .x-list-item-odd.x-list-footer-wrap>.x-dock-body {
	background-color: #eaeaea !important
}

.x-list .x-list-item-odd.x-list-item-tpl,
.x-list .x-list-item-odd .x-dock-horizontal {
	background-color: #eaeaea !important;
	border-bottom: 1px solid #eaeaea
}

.x-picker .x-picker-inner {
	background-color: #fff;
	overflow: hidden;
	margin: 0.7em;
	-webkit-border-radius: 0.4em;
	-moz-border-radius: 0.4em;
	-ms-border-radius: 0.4em;
	-o-border-radius: 0.4em;
	border-radius: 0.4em;
	-webkit-background-clip: padding;
	-moz-background-clip: padding;
	background-clip: padding-box;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #bbb), color-stop(30%, #fff), color-stop(70%, #fff), color-stop(100%, #bbb));
	background: -webkit-linear-gradient(top, #bbb 0%, #fff 30%, #fff 70%, #bbb 100%)
}

.x-picker-slot .x-scroll-view {
	-webkit-box-shadow: rgba(0, 0, 0, 0.4) -1px 0 1px;
	-moz-box-shadow: rgba(0, 0, 0, 0.4) -1px 0 1px;
	box-shadow: rgba(0, 0, 0, 0.4) -1px 0 1px
}

.x-picker-slot .x-scroll-view:first-child {
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none
}

.x-picker-bar {
	border-top: 0.12em solid #ffc61e;
	border-bottom: 0.12em solid #ffc61e;
	height: 2.5em;
	background-image: none;
	background-color: rgba(242, 184, 13, 0.3);
	-webkit-box-shadow: rgba(0, 0, 0, 0.2) 0 0.2em 0.2em;
	-moz-box-shadow: rgba(0, 0, 0, 0.2) 0 0.2em 0.2em;
	box-shadow: rgba(0, 0, 0, 0.2) 0 0.2em 0.2em
}

.x-use-titles .x-picker-bar {
	margin-top: 1.5em
}

.x-picker-slot-title {
	height: 1.5em;
	border-top: 1px solid #00987b;
	border-bottom: 1px solid #003228;
	padding: 0.2em 1.02em;
	-webkit-box-shadow: rgba(0, 0, 0, 0.3) 0px 0.1em 0.3em;
	-moz-box-shadow: rgba(0, 0, 0, 0.3) 0px 0.1em 0.3em;
	box-shadow: rgba(0, 0, 0, 0.3) 0px 0.1em 0.3em;
	background-image: none;
	background-color: #00987b
}

.x-picker-slot-title>div {
	font-size: 0.8em;
	color: #000;
	text-shadow: rgba(255, 255, 255, 0.25) 0 0.08em 0
}

.x-picker-slot {
	border-left: 2px solid #acacac
}

.x-picker-slot .x-dataview-item {
	height: 2.5em;
	line-height: 2.5em;
	font-weight: bold;
	padding: 0 10px
}

.x-picker-slot:first-child {
	border-left: 0
}

.x-list-paging {
	padding: 1em 0
}

.x-list-paging .x-list-paging-msg {
	color: #ffc61e;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	-ms-border-radius: 6px;
	-o-border-radius: 6px;
	border-radius: 6px
}

.x-list-paging.x-loading {
	padding: 0.5em
}

.x-list-pullrefresh-arrow {
	background: center center url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAA8CAYAAAAUufjgAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAjFJREFUeNrsmU8oREEYwOexdtNuKBfFwdVhCyfuysnFiXISS+1BLopyUpKLXETkRLaUi1LK3Q2lpPbiQLnIn03a/Hm+z86Ttv0zM++bfbOar36Hbad5v535Zp7v47iuy0wOpyoEHccRHV9L9NxPkUE/bhKCOKiOSPAdn69DsJ5I8E2HYA0QJRJ8Bb50CDYRCT7pEMQD0kwk+CByUFQEW4gE73UIhoA2IsFb4ENEMCQ5MdU1IxwygpT3oKNLMGyyYFVscdhusc8tDpu+xRG7xf95BW0O2kNiV1AgIvaQ2BzUJNgJNJYZGyUU7OG1cal4Bi68oqkDPszy2teEwJp5Cdyu/lZ1g8CwIYJ7wEF+2YmrNw90Byx3BizgKhaqizEP1wg7CLLxCEzy/CtauMeBlQDyEfNuGrgU6SyM8F9SyVgHdmRaH6tAb4XkToEp2d4M5mOK0TWMigU2koa8vJMRZPxEb2ss2LEVPMpPLlMRxBgDZjQJLgNbxb6Uab9tAn3EcifAeKkBMoLY+j0GWonk7oB+lmsFkwhidAGHBPmIeTcAnJcbKCuIMQEs+hScAzZEBqoIYuzyFVCJI36lMJ2CDfxibZeUu+EX/4uMIFP8ZyLejxkgK0hG5a8kP4IYSZbr1IuQVHmAX0HGX4VuGfZVJ6cQxPd1uoRcWqDW0SroFVzZAnJZ/h0LWhAjUUAw4XdSSsH8fExRTEgtGAOuOTETBb16Jk412e+bxOSwglYw6PgWYABvLk8P7zGJFwAAAABJRU5ErkJggg==') no-repeat;
	background-size: 2em 3em;
	-webkit-transition-property: -webkit-transform;
	-webkit-transition-duration: 200ms;
	-webkit-transform: rotate(0deg);
	-moz-transform: rotate(0deg);
	-ms-transform: rotate(0deg);
	-o-transform: rotate(0deg);
	transform: rotate(0deg)
}

.x-android-2 .x-list-pullrefresh-arrow {
	-webkit-transition-property: none;
	-webkit-transition-duration: 0
}

.x-list-pullrefresh-release .x-list-pullrefresh-arrow {
	-webkit-transform: rotate(-180deg);
	-moz-transform: rotate(-180deg);
	-ms-transform: rotate(-180deg);
	-o-transform: rotate(-180deg);
	transform: rotate(-180deg)
}

.x-list-pullrefresh-message {
	margin-bottom: 0.1em
}

.x-slider,
.x-toggle {
	height: 2.2em
}

.x-slider.x-item-disabled {
	opacity: .6
}

.x-thumb {
	height: 2.2em;
	width: 2.2em;
	background: transparent none;
	border: 0
}

.x-thumb:after {
	border: 1px solid #919191;
	content: '';
	position: absolute;
	width: 1.85em;
	height: 1.85em;
	top: 0.175em;
	left: 0.175em;
	background-image: none;
	background-color: #ddd;
	background-image: -webkit-linear-gradient(top, #ffffff, #eaeaea 3%, #d0d0d0);
	background-image: -moz-linear-gradient(top, #ffffff, #eaeaea 3%, #d0d0d0);
	background-image: -o-linear-gradient(top, #ffffff, #eaeaea 3%, #d0d0d0);
	background-image: -ms-linear-gradient(top, #ffffff, #eaeaea 3%, #d0d0d0);
	-webkit-background-clip: padding;
	-moz-background-clip: padding;
	background-clip: padding-box;
	-webkit-border-radius: 0.925em;
	-moz-border-radius: 0.925em;
	-ms-border-radius: 0.925em;
	-o-border-radius: 0.925em;
	border-radius: 0.925em
}

.x-thumb.x-dragging {
	opacity: 1
}

.x-thumb.x-dragging:after {
	background-image: none;
	background-color: #d0d0d0;
	background-image: -webkit-linear-gradient(top, #f7f7f7, #dddddd 3%, #c4c4c4);
	background-image: -moz-linear-gradient(top, #f7f7f7, #dddddd 3%, #c4c4c4);
	background-image: -o-linear-gradient(top, #f7f7f7, #dddddd 3%, #c4c4c4);
	background-image: -ms-linear-gradient(top, #f7f7f7, #dddddd 3%, #c4c4c4)
}

.x-slider:before {
	margin: 0 0.925em;
	border: 0.1em solid rgba(0, 0, 0, 0.1);
	border-bottom: 0;
	content: '';
	position: absolute;
	width: auto;
	height: 0.8em;
	top: 0.737em;
	left: 0;
	background-image: none;
	background-color: #ddd;
	background-image: -webkit-linear-gradient(top, #c4c4c4, #d0d0d0 10%, #dddddd 65%, #dedede);
	background-image: -moz-linear-gradient(top, #c4c4c4, #d0d0d0 10%, #dddddd 65%, #dedede);
	background-image: -o-linear-gradient(top, #c4c4c4, #d0d0d0 10%, #dddddd 65%, #dedede);
	background-image: -ms-linear-gradient(top, #c4c4c4, #d0d0d0 10%, #dddddd 65%, #dedede);
	-webkit-box-shadow: rgba(255, 255, 255, 0.7) 0 0.1em 0;
	-moz-box-shadow: rgba(255, 255, 255, 0.7) 0 0.1em 0;
	box-shadow: rgba(255, 255, 255, 0.7) 0 0.1em 0;
	-webkit-border-radius: 0.4em;
	-moz-border-radius: 0.4em;
	-ms-border-radius: 0.4em;
	-o-border-radius: 0.4em;
	border-radius: 0.4em
}

.x-toggle {
	width: 4.4em;
	border: 1px solid #b7b7b7;
	background-image: none;
	background-color: #ddd;
	background-image: -webkit-linear-gradient(top, #c4c4c4, #d0d0d0 10%, #dddddd 65%, #dedede);
	background-image: -moz-linear-gradient(top, #c4c4c4, #d0d0d0 10%, #dddddd 65%, #dedede);
	background-image: -o-linear-gradient(top, #c4c4c4, #d0d0d0 10%, #dddddd 65%, #dedede);
	background-image: -ms-linear-gradient(top, #c4c4c4, #d0d0d0 10%, #dddddd 65%, #dedede);
	-webkit-border-radius: 1.1em;
	-moz-border-radius: 1.1em;
	-ms-border-radius: 1.1em;
	-o-border-radius: 1.1em;
	border-radius: 1.1em
}

.x-toggle .x-thumb.x-dragging {
	opacity: 1
}

.x-toggle .x-thumb:before {
	top: 0.175em
}

.x-toggle-on {
	background-image: none;
	background-color: #92cf00;
	background-image: -webkit-linear-gradient(top, #6e9c00, #80b500 10%, #92cf00 65%, #94d200);
	background-image: -moz-linear-gradient(top, #6e9c00, #80b500 10%, #92cf00 65%, #94d200);
	background-image: -o-linear-gradient(top, #6e9c00, #80b500 10%, #92cf00 65%, #94d200);
	background-image: -ms-linear-gradient(top, #6e9c00, #80b500 10%, #92cf00 65%, #94d200)
}

.x-tab.x-item-disabled span.x-button-label,
.x-tab.x-item-disabled span.x-badge,
.x-tab.x-item-disabled .x-hasbadge span.x-badge,
.x-hasbadge .x-tab.x-item-disabled span.x-badge,
.x-tab.x-item-disabled .x-button-icon {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
	opacity: 0.5
}

.x-tab.x-draggable {
	filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=70);
	opacity: 0.7
}

.x-android-4.x-android-stock .x-tabbar .x-tab .x-button-label,
.x-android-4.x-android-stock .x-tabbar .x-tab .x-badge,
.x-android-4.x-android-stock .x-tabbar .x-tab .x-hasbadge .x-badge,
.x-hasbadge .x-android-4.x-android-stock .x-tabbar .x-tab .x-badge {
	text-rendering: inherit !important
}

.x-tabbar.x-docked-top {
	height: 2.6em;
	padding: 0 .8em
}

.x-tabbar.x-docked-top .x-tab {
	background: transparent none;
	border: 0;
	padding: 0.4em 0.8em;
	height: 1.8em;
	-webkit-border-radius: 0.9em;
	-moz-border-radius: 0.9em;
	-ms-border-radius: 0.9em;
	-o-border-radius: 0.9em;
	border-radius: 0.9em
}

.x-tabbar.x-docked-top .x-tab .x-button-label,
.x-tabbar.x-docked-top .x-tab .x-badge,
.x-tabbar.x-docked-top .x-tab .x-hasbadge .x-badge,
.x-hasbadge .x-tabbar.x-docked-top .x-tab .x-badge {
	font-size: .8em;
	line-height: 1.2em;
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased
}

.x-tabbar.x-docked-top .x-tab .x-badge {
	font-size: .6em !important;
	top: -0.5em
}

.x-tabbar.x-docked-top .x-tab .x-button-icon {
	width: 1.2em;
	height: 1.2em;
	margin: 0 auto
}

.x-tabbar.x-docked-top .x-tab .x-button-icon:before {
	font-size: 1.6em
}

.x-tabbar.x-docked-top .x-tab.x-tab-icon {
	padding: 0.3em 0.8em
}

.x-tabbar.x-docked-top .x-tab.x-tab-icon .x-button-label,
.x-tabbar.x-docked-top .x-tab.x-tab-icon .x-badge,
.x-tabbar.x-docked-top .x-tab.x-tab-icon .x-hasbadge .x-badge,
.x-hasbadge .x-tabbar.x-docked-top .x-tab.x-tab-icon .x-badge {
	margin: 0;
	margin-left: .8em;
	padding: .1em 0 .2em 0;
	display: inline-block;
	position: relative;
	top: -0.2em
}

.x-tabbar.x-docked-bottom {
	height: 3em;
	padding: 0
}

.x-tabbar.x-docked-bottom .x-tab {
	background: transparent none;
	border: 0;
	padding-top: .2em;
	-webkit-border-radius: 0.25em;
	-moz-border-radius: 0.25em;
	-ms-border-radius: 0.25em;
	-o-border-radius: 0.25em;
	border-radius: 0.25em;
	-webkit-box-orient: vertical;
	-ms-flex-direction: column;
	flex-direction: column
}

.x-tabbar.x-docked-bottom .x-tab .x-button-icon {
	width: 1.65em;
	height: 1.65em;
	margin: 0 auto
}

.x-tabbar.x-docked-bottom .x-tab .x-button-icon:before {
	font-size: 1.6em;
	line-height: 1.1em
}

.x-tabbar.x-docked-bottom .x-tab .x-button-label,
.x-tabbar.x-docked-bottom .x-tab .x-badge,
.x-tabbar.x-docked-bottom .x-tab .x-hasbadge .x-badge,
.x-hasbadge .x-tabbar.x-docked-bottom .x-tab .x-badge {
	margin: 0;
	padding: .1em 0 .2em 0;
	font-size: 9px;
	line-height: 12px;
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased
}

.x-tabbar-light {
	border-top-color: #055f4e;
	border-bottom-color: #022f27;
	background-image: none;
	background-color: #067862
}

.x-tabbar-light .x-tab {
	color: #54f6d7;
	border-bottom: 1px solid transparent
}

.x-tabbar-light .x-tab-active {
	color: #fff;
	border-bottom-color: #07866e
}

.x-tabbar-light .x-tab-active .x-button-icon:before {
	color: #ffe084
}

.x-tabbar-light .x-tab-pressed {
	color: #fff
}

.x-tabbar-light.x-docked-bottom .x-tab {
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0
}

.x-tabbar-light.x-docked-bottom .x-tab-active {
	background-image: none;
	background-color: #055f4e;
	background-image: -webkit-linear-gradient(top, #022f27, #04473a 10%, #055f4e 65%, #056250);
	background-image: -moz-linear-gradient(top, #022f27, #04473a 10%, #055f4e 65%, #056250);
	background-image: -o-linear-gradient(top, #022f27, #04473a 10%, #055f4e 65%, #056250);
	background-image: -ms-linear-gradient(top, #022f27, #04473a 10%, #055f4e 65%, #056250);
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0;
	-webkit-box-shadow: #04473a 0 0 0.25em inset;
	-moz-box-shadow: #04473a 0 0 0.25em inset;
	box-shadow: #04473a 0 0 0.25em inset
}

.x-tabbar-light.x-docked-bottom .x-tab-active .x-button-icon:before {
	color: #ffe084
}

.x-tabbar-light.x-docked-top .x-tab-active {
	background-image: none;
	background-color: #055f4e;
	background-image: -webkit-linear-gradient(top, #022f27, #04473a 10%, #055f4e 65%, #056250);
	background-image: -moz-linear-gradient(top, #022f27, #04473a 10%, #055f4e 65%, #056250);
	background-image: -o-linear-gradient(top, #022f27, #04473a 10%, #055f4e 65%, #056250);
	background-image: -ms-linear-gradient(top, #022f27, #04473a 10%, #055f4e 65%, #056250);
	color: #fff
}

.x-tabbar-dark {
	border-top-color: #000;
	border-bottom-color: #000;
	background-image: none;
	background-color: #001813
}

.x-tabbar-dark .x-tab {
	color: #00e4b9;
	border-bottom: 1px solid transparent
}

.x-tabbar-dark .x-tab-active {
	color: #e4fffa;
	border-bottom-color: #002720
}

.x-tabbar-dark .x-tab-active .x-button-icon:before {
	color: #ffedb7
}

.x-tabbar-dark .x-tab-pressed {
	color: #fff
}

.x-tabbar-dark.x-docked-bottom .x-tab {
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0
}

.x-tabbar-dark.x-docked-bottom .x-tab-active {
	background-image: none;
	background-color: #000;
	background-image: -webkit-linear-gradient(top, #000000, #000000 10%, #000000 65%, #000302);
	background-image: -moz-linear-gradient(top, #000000, #000000 10%, #000000 65%, #000302);
	background-image: -o-linear-gradient(top, #000000, #000000 10%, #000000 65%, #000302);
	background-image: -ms-linear-gradient(top, #000000, #000000 10%, #000000 65%, #000302);
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0;
	-webkit-box-shadow: #000 0 0 0.25em inset;
	-moz-box-shadow: #000 0 0 0.25em inset;
	box-shadow: #000 0 0 0.25em inset
}

.x-tabbar-dark.x-docked-bottom .x-tab-active .x-button-icon:before {
	color: #ffedb7
}

.x-tabbar-dark.x-docked-top .x-tab-active {
	background-image: none;
	background-color: #000;
	background-image: -webkit-linear-gradient(top, #000000, #000000 10%, #000000 65%, #000302);
	background-image: -moz-linear-gradient(top, #000000, #000000 10%, #000000 65%, #000302);
	background-image: -o-linear-gradient(top, #000000, #000000 10%, #000000 65%, #000302);
	background-image: -ms-linear-gradient(top, #000000, #000000 10%, #000000 65%, #000302);
	color: #b3fff0
}

.x-tabbar-neutral {
	border-top-color: #d3d3d3;
	border-bottom-color: #bababa;
	background-image: none;
	background-color: #e0e0e0
}

.x-tabbar-neutral .x-tab {
	color: #7a7a7a;
	border-bottom: 1px solid transparent
}

.x-tabbar-neutral .x-tab-active {
	color: #000;
	border-bottom-color: #e8e8e8
}

.x-tabbar-neutral .x-tab-active .x-button-icon:before {
	color: #7a7a7a
}

.x-tabbar-neutral .x-tab-pressed {
	color: #000
}

.x-tabbar-neutral.x-docked-bottom .x-tab {
	text-shadow: rgba(255, 255, 255, 0.25) 0 0.08em 0
}

.x-tabbar-neutral.x-docked-bottom .x-tab-active {
	background-image: none;
	background-color: #d3d3d3;
	background-image: -webkit-linear-gradient(top, #bababa, #c7c7c7 10%, #d3d3d3 65%, #d5d5d5);
	background-image: -moz-linear-gradient(top, #bababa, #c7c7c7 10%, #d3d3d3 65%, #d5d5d5);
	background-image: -o-linear-gradient(top, #bababa, #c7c7c7 10%, #d3d3d3 65%, #d5d5d5);
	background-image: -ms-linear-gradient(top, #bababa, #c7c7c7 10%, #d3d3d3 65%, #d5d5d5);
	text-shadow: rgba(255, 255, 255, 0.25) 0 0.08em 0;
	-webkit-box-shadow: #c7c7c7 0 0 0.25em inset;
	-moz-box-shadow: #c7c7c7 0 0 0.25em inset;
	box-shadow: #c7c7c7 0 0 0.25em inset
}

.x-tabbar-neutral.x-docked-bottom .x-tab-active .x-button-icon:before {
	color: #7a7a7a
}

.x-tabbar-neutral.x-docked-top .x-tab-active {
	background-image: none;
	background-color: #d3d3d3;
	background-image: -webkit-linear-gradient(top, #bababa, #c7c7c7 10%, #d3d3d3 65%, #d5d5d5);
	background-image: -moz-linear-gradient(top, #bababa, #c7c7c7 10%, #d3d3d3 65%, #d5d5d5);
	background-image: -o-linear-gradient(top, #bababa, #c7c7c7 10%, #d3d3d3 65%, #d5d5d5);
	background-image: -ms-linear-gradient(top, #bababa, #c7c7c7 10%, #d3d3d3 65%, #d5d5d5);
	color: #000
}

.x-grid {
	background-color: #fff !important
}

.x-grid .x-grid-header-container {
	border-color: #d7d7d7;
	background-color: #f5f5f5;
	color: #000000
}

.x-grid .x-grid-header-container .x-grid-column-resizing {
	background-color: #D2EDFE
}

.x-grid .x-grid-column {
	border-color: #fff #d7d7d7 #d7d7d7 #fff
}

.x-grid .x-grid-column.x-column-sorted-asc,
.x-grid .x-grid-column.x-column-sorted-desc {
	color: #1464AE
}

.x-grid .x-grid-headergroup .x-inner>.x-innerhtml {
	border-color: #fff #d7d7d7 #d7d7d7 #fff
}

.x-grid .x-grid-row {
	border-color: #d7d7d7;
	color: #000
}

.x-grid .x-grid-row.x-grid-item-odd {
	background-color: #fafafa
}

.x-grid .x-grid-row.x-item-selected {
	background-color: #D2EDFE
}

.x-grid .x-grid-cell {
	border-color: #d7d7d7
}

.x-grid .x-grid-viewoptions {
	background-color: #fff;
	border-color: #C0C0C0
}

.x-grid .x-grid-viewoptions .x-column-options-header {
	background: #1464AE;
	border-color: #fff #d7d7d7 #d7d7d7 #fff;
	color: #fff
}

.x-grid .x-grid-viewoptions .x-column-options-sortablehandle {
	color: #aaa
}

.x-grid .x-grid-viewoptions .x-column-options-text {
	color: #000
}

.x-grid .x-grid-viewoptions .x-list-item.x-list-item-tpl {
	border-top-color: #ccc
}

.x-grid .x-grid-viewoptions .x-column-options-visibleindicator {
	color: #1464AE
}

.x-grid .x-grid-viewoptions .x-column-options-groupindicator {
	color: #C0C0C0
}

.x-grid .x-grid-viewoptions .x-column-options-folder,
.x-grid .x-grid-viewoptions .x-column-options-leaf {
	color: #91E698
}

.x-grid .x-grid-viewoptions .x-column-options-hidden .x-column-options-visibleindicator,
.x-grid .x-grid-viewoptions .x-column-options-hidden .x-column-options-text,
.x-grid .x-grid-viewoptions .x-column-options-hidden .x-column-options-folder,
.x-grid .x-grid-viewoptions .x-column-options-hidden .x-column-options-leaf {
	color: #C0C0C0
}

.x-grid .x-grid-viewoptions .x-column-options-grouped .x-column-options-groupindicator {
	color: #1464AE
}

.x-grid .x-grid-columnoptions {
	border-color: #d7d7d7
}

.x-grid .x-grid-multiselection-column {
	color: #C0C0C0
}

.x-grid .x-grid-multiselection-column.x-grid-multiselection-allselected:after {
	color: #1464AE !important
}

.x-grid .x-grid-multiselection-cell {
	color: #C0C0C0
}

.x-grid .x-item-selected .x-grid-multiselection-cell:after {
	color: #1464AE
}

.x-grid .x-grid-pagingtoolbar {
	border-top-color: #d7d7d7
}

.x-grid .x-grid-summaryrow {
	background-color: #1464AE;
	color: #fff
}

.x-grid .x-grid-summaryrow .x-grid-cell {
	border-color: #C0C0C0
}

.x-grid .x-grid-header {
	background-image: none;
	background-color: #00e4b9;
	color: #004b3d;
	text-shadow: rgba(0, 0, 0, 0.5) 0 -0.08em 0;
	border-top: 1px solid #00e4b9;
	border-bottom: 1px solid #007e66;
	padding: 0 1.02em
}

@font-face {
	font-family: 'Open Sans';
	src: url("../../resources/fonts/open-sans-regular.woff") format("woff");
	font-weight: normal;
	font-style: normal
}

@font-face {
	font-family: 'Open Sans';
	src: url("../../resources/fonts/open-sans-italic.woff") format("woff");
	font-weight: normal;
	font-style: italic
}

@font-face {
	font-family: 'Open Sans';
	src: url("../../resources/fonts/open-sans-bold.woff") format("woff");
	font-weight: bold;
	font-style: normal
}

@font-face {
	font-family: 'Open Sans';
	src: url("../../resources/fonts/open-sans-bold-italic.woff") format("woff");
	font-weight: bold;
	font-style: italic
}

.x-layout-card-item {
	box-shadow: 0 0 3em rgba(0, 0, 0, 0.6)
}

.message-ct {
	background-image: none;
	background-color: #ffe8a5;
	background-image: -webkit-linear-gradient(top, #ffdb72, #ffe18b 10%, #ffe8a5 65%, #ffe9a8);
	background-image: -moz-linear-gradient(top, #ffdb72, #ffe18b 10%, #ffe8a5 65%, #ffe9a8);
	background-image: -o-linear-gradient(top, #ffdb72, #ffe18b 10%, #ffe8a5 65%, #ffe9a8);
	background-image: -ms-linear-gradient(top, #ffdb72, #ffe18b 10%, #ffe8a5 65%, #ffe9a8)
}

.message-ct .x-innerhtml {
	font-size: small;
	padding: .4em 1.2em
}

.acp-title>.x-innerhtml {
	color: white;
	font-weight: bold;
	font-size: medium;
	line-height: 1;
	text-align: right;
	text-shadow: none;
	white-space: normal
}

.acp-titlebar-logo {
	height: 1.2em;
	margin-left: .6em;
	vertical-align: -0.2em;
	width: auto
}

.x-tabbar.x-docked-top {
	background: #007e66;
	height: auto;
	padding-bottom: .4em
}

.x-tabbar.x-docked-top .x-tab {
	background: none;
	border: 1px solid white;
	color: white;
	border-radius: 0
}

.x-tabbar.x-docked-top .x-tab.x-tab-pressed {
	background: rgba(255, 255, 255, 0.3)
}

.x-tabbar.x-docked-top .x-tab.x-tab-active {
	background: white;
	color: #007e66
}

.x-tabbar.x-docked-top .x-tab:first-child {
	-moz-border-radius-topleft: 0.3em;
	-webkit-border-top-left-radius: 0.3em;
	border-top-left-radius: 0.3em;
	-moz-border-radius-bottomleft: 0.3em;
	-webkit-border-bottom-left-radius: 0.3em;
	border-bottom-left-radius: 0.3em
}

.x-tabbar.x-docked-top .x-tab:last-child {
	-moz-border-radius-topright: 0.3em;
	-webkit-border-top-right-radius: 0.3em;
	border-top-right-radius: 0.3em;
	-moz-border-radius-bottomright: 0.3em;
	-webkit-border-bottom-right-radius: 0.3em;
	border-bottom-right-radius: 0.3em
}

.x-tabbar.x-docked-top .x-tab+.x-tab {
	border-left: none
}

.settings-sheet {
	background: white;
	border: none;
	box-shadow: 0 0 1em rgba(0, 0, 0, 0.2)
}

.settings-sheet .x-field {
	margin: -0.7em -0.7em 0.7em
}

.settings-sheet .x-form-label {
	padding: .6em 1em
}

.font-slider-labels {
	margin-top: -0.6em;
	padding: 0 1em .6em
}

.font-slider-labels .small {
	font-size: .7em;
	text-align: left
}

.font-slider-labels .medium {
	font-size: .8em;
	text-align: center
}

.font-slider-labels .large {
	font-size: 1em;
	text-align: right
}

.settings-help-buttons {
	border-top: 1px solid #e5e5e5;
	padding-top: 1.2em
}

.settings-help-buttons .x-button {
	background: #e5e5e5;
	font-size: small;
	min-height: 44px
}

.settings-help-buttons .x-button.x-button-pressing,
.settings-help-buttons .x-button.x-button-pressed {
	background: #ccc
}

.settings-help-buttons .x-button+.x-button {
	margin-left: .6em
}

.settings-version .x-innerhtml {
	color: #999;
	font-size: small;
	padding: 1em 1em 0;
	text-align: center
}

.x-list-normal .x-list-header {
	background: #cce5e0;
	border: none;
	font-size: medium;
	margin: -1px 0;
	padding: .4em 1.2em;
	text-shadow: none
}

.x-list-normal .x-list-item {
	font-size: small
}

.x-list-emptytext .x-innerhtml {
	color: #999;
	font-style: italic;
	padding: 1.8em
}

.small-fonts.x-html {
	font-size: 0.7em
}

.large-fonts.x-html {
	font-size: 1.3em
}

.medium-fonts {
  font-size: 1em
}

.x-html h1,
.x-html h2,
.x-html h3,
.x-html h4,
.x-html h5,
.x-html h6 {
	color: ${interpolationHTag(isDark)};
}

.x-html h1 {
	font-size: 1.8em;
	font-weight: 600;
	line-height: 1.2
}


.x-html h2 {
	font-size: 1.2em;
	font-weight: 600
}

.x-html .bodyContainer h1 {
	font-size: 1.2em;
	margin-bottom: 0.125em
}

.x-html .bodyContainer h2 {
	font-size: 1em;
	margin-bottom: 0
}

.x-html .headerTitle+.headerTitle {
	color: ${interpolationSubtitle(isDark)};
	font-weight: normal;
	margin-top: 0.10em
}

.x-html .tableContainer .tableHeader {
	margin: 0 -1.2em 1.5em;
	padding: .3em 1.2em
}

.x-html .returnLink {
	display: none
}

.x-html .swipeLink {
	color:  ${interpolationSwipeLinkText(isDark)};
	font-style: italic;
	margin-top: 1em;
	text-align: left;
}

.x-html .swipeLink::after {
	content: '\\00a0\\2192'
}

.x-html .swipeLink.side {
	display: none
}

.last-page .swipeLink {
	display: none
}

.x-menu {
	background: #444;
	box-shadow: 0 0 3em rgba(0, 0, 0, 0.6);
	padding: 0
}

.x-menu .menu-button {
	background: #666;
	border: none;
	border-radius: 0;
	margin: 0 0 1px 1px;
	min-height: 44px;
	padding: .6em
}

.x-menu .menu-button.x-button-pressing,
.x-menu .menu-button.x-button-pressed {
	background: #997612
}

.x-menu .menu-button .x-button-label,
.x-menu .menu-button .x-badge,
.x-menu .menu-button .x-hasbadge .x-badge,
.x-hasbadge .x-menu .menu-button .x-badge {
	color: white;
	font-size: smaller;
	font-weight: normal;
	text-align: left;
	white-space: normal
}

.x-container.articleCt * {
	-webkit-user-select: auto
}

.x-container.versionCt .x-html {
	text-align: center;
	font-weight: bold
}

.linkFullText {
	display: inline-block;
	padding-right: 12px;
	background-repeat: no-repeat;
	background-position: right center;
	background-size: 9px 9px;
	margin-bottom: 10px;
	margin-right: 20px;
	color: ${interpolationLinkFullText(isDark)}
}

.linkFullText:visited {
	color: ${interpolationLinkFullText(isDark)}
}

.linkFullText:link {
	color: ${interpolationLinkFullText(isDark)}
}

.linkFullText:active {
	color: ${interpolationLinkFullText(isDark)};
	font-weight: bold
}

.linkFullText:hover {
	color: ${interpolationLinkFullText(isDark)};
	font-weight: bold
}

.acpmessagebox {
	color: #005848;
	background-color: #ffffff
}

.acpmessagebox {
	color: #005848 !important;
	background-color: #eeeeee !important
}

.acpmessagebox .x-toolbar-dark .x-title {
	color: #005848 !important
}

.acpmessagebox .x-msgbox-text {
	color: #555555 !important;
	text-shadow: none !important
}

.acpmessagebox .x-button {
	border: 1px solid #007E66 !important;
	background-color: #CCE5E0 !important
}

.new::after {
	content: ' *NEW* ';
	color: #F77F00;
	font-weight: bold
}
;

''';
}
