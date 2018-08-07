---
date: 2017-12-16
title: Typography
weight: 51
menu:
  main:
    parent: "Site Info" 
    identifier: siteinfo
    weight: 51
---

This book includes some diagrams that are rendered  
on the client side from various graphical markup systems. 

This page lets you verify that you can read the glyph and diagrams correctly. If
you do not see two of everything, then you will not be able to see some of the
diagrams in the book. In that case, please report the
[issue](https://github.com/virtualdataset/virtdata-docs/issues).

In each of the rendering checks below, the dynamically rendered element is shown
first, followed by a reference image.

### jsxgraph rendering

courtesy of [jsxgraph](http://jsxgraph.uni-bayreuth.de/wp/index.html)

<div title="dynamically rendered" align="middle">
{{< jsxgraph id="jsxtest">}}
  var brd = JXG.JSXGraph.initBoard('jsxtest', { boundingbox:[-10,10,10,-10], axis:true, showCopyright: false});
//  brd.suspendUpdate(); 
  var axisx = brd.create('axis', [[0,0], [1,0]],    
  {
    firstArrow: true,
    lastArrow: true, 
    ticks: {
      drawZero: true,
      ticksDistance: 1,
      majorHeight: 30,
      tickEndings: [1,1],
      minorTicks: 0
    }  
  });
{{</ jsxgraph >}}
</div>

<div title="reference image" align="middle">  
<img src="/siteinfo/jsxgraph.png"></img> 
</div>

### Mermaid.js rendering  
 
courtesy of [mermaid.js](https://knsv.github.io/mermaid/) 

<div title="rendered dynamically" align="middle">

{{< mermaid >}}
graph LR
A-->B
B-->C
C-->A
{{</ mermaid >}}

</div>

<div title="reference image" align="middle">
<img src="/siteinfo/mermaid_abc.png"></img>
</div>

### nomnoml rendering

courtesy of [nomnoml.com](http://nomnoml.com/)

<div title="rendered dynamically" align="middle">
{{< nomnoml >}}
 #direction: right
 [A] -> [B]
 [B] ->  [C]
 [C] -> [A]
{{</ nomnoml >}}
</div>

<div title="reference image" align="middle">
<img src="/siteinfo/nomnoml_abc.png"></img> 
</div>

### railroad diagram rendering

courtesy of [railroad-diagrams](https://github.com/tabatkins/railroad-diagrams)

<div align="middle">{{< rr align="middle">}}'<IDENTIFIER: name>'{{< /rr >}}</div>

<div title="reference image" align="middle">
<div><img src="/siteinfo/railroad_id.png" width="30%"></img>
</div>

