<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:dbk="http://docbook.org/ns/docbook"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:m="http://www.w3.org/1998/Math/MathML"
  xmlns="http://www.w3.org/1999/xhtml">

<xsl:output
  method="html"
  omit-xml-declaration="no"
  encoding="utf-8"
  indent="no" 
  />

<xsl:template match="dbk:article">
  <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
	<html lang="en">
		<head>
		  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

      <script type="text/x-mathjax-config">
      MathJax.Hub.Config({
        "HTML-CSS": {
          scale: 200
        }
      });
      </script>
      <script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>

		  <script type="text/javascript" src="static/hyphenate.js"></script>

		  <link rel="stylesheet" type="text/css"  href='http://fonts.googleapis.com/css?family=Crimson+Text:regular,regularitalic,600,600italic' />
		  <link rel="stylesheet" type="text/css"  href="static/main.css" />
		  <link rel="icon"       type="image/png" href="static/favicon.png" />

		  <title>eegg</title>
		</head>
		<body>
			<div class="main">
        <div style="height: 1px; margin-bottom: -1px;"></div> <!-- margin-collapse hack -->
        <div id="masthead">Eegg.</div>

				<xsl:apply-templates />
        
        <div id="disqus_thread"></div>

			  <script type="text/javascript">
		      var disqus_shortname = 'eegg';
		      var disqus_identifier = 'page_margins';
		      var disqus_url = 'http://eegg.github.com/margins.xml';
			  </script>
			  <script src="http://eegg.disqus.com/embed.js" type="text/javascript"></script>
			</div>
		</body>
	</html>
</xsl:template>


<xsl:template match="dbk:section">
	<section>
		<xsl:apply-templates />
	</section>
</xsl:template>

<xsl:template match="dbk:title">
  <xsl:if test="parent::dbk:article">
    <h1 class="articleTitle"><xsl:apply-templates /></h1>
  </xsl:if>
  <xsl:if test="not(parent::dbk:article)">
    <!-- TODO: levels -->
    <h2><span class="outdentHeader"><xsl:number level="multiple" count="dbk:section" /></span><xsl:apply-templates /></h2>
  </xsl:if>
</xsl:template>

<xsl:template match="dbk:abstract">
  <div class="abstract">
    <span class="abstractWord">Abstract</span>
    <xsl:apply-templates />
  </div>
</xsl:template>

<xsl:template match="dbk:blockquote">
	<blockquote>
        <xsl:apply-templates select="*[not(self::dbk:attribution)]" />
        <xsl:apply-templates select="dbk:attribution" />
	</blockquote>
</xsl:template>

<xsl:template match="dbk:attribution">
	<cite>
		<xsl:apply-templates />
	</cite>
</xsl:template>

<xsl:template match="dbk:para">
	<p class="hyphenate">
		<xsl:apply-templates />
	</p>
</xsl:template>



<xsl:template match="dbk:acronym">
	<span class="acronym"><xsl:apply-templates /></span>
</xsl:template>

<xsl:template match="dbk:link">
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="@xlink:href" />
		</xsl:attribute>
		<xsl:apply-templates />
	</a>
</xsl:template>

<xsl:template match="dbk:sidebar">
	<div class="sidebar">
		<xsl:apply-templates />
	</div>
</xsl:template>

<xsl:template match="dbk:emphasis[@role='strong']"><strong><xsl:apply-templates /></strong></xsl:template>
<xsl:template match="dbk:emphasis"><em><xsl:apply-templates /></em></xsl:template>

<xsl:template match="dbk:itemizedlist"><ul><xsl:apply-templates /></ul></xsl:template>
<xsl:template match="dbk:orderedlist"><ol><xsl:apply-templates /></ol></xsl:template>
<xsl:template match="dbk:listitem"><li><xsl:apply-templates /></li></xsl:template>
<xsl:template match="dbk:quote"><q><xsl:apply-templates /></q></xsl:template>

<xsl:template match="dbk:table"><table class="widescreen"><xsl:apply-templates /></table></xsl:template>
<xsl:template match="dbk:thead"><thead><xsl:apply-templates /></thead></xsl:template>
<xsl:template match="dbk:tbody"><tbody><xsl:apply-templates /></tbody></xsl:template>
<xsl:template match="dbk:row"><tr><xsl:apply-templates /></tr></xsl:template>
<xsl:template match="dbk:entry"><td><xsl:apply-templates /></td></xsl:template>

<!-- fix hack -->
<xsl:template match="dbk:mediaobject">
	<figure>
		<xsl:apply-templates select="dbk:caption" />
		<xsl:apply-templates select="*[not(self::dbk:caption)]" />
	</figure>
</xsl:template>
<xsl:template match="dbk:caption">
	<div class="sidebar">
		<figcaption>
			<xsl:apply-templates />
		</figcaption>
	</div>
</xsl:template>
<xsl:template match="dbk:imageobject">
  <img>
    <xsl:if test="@widthclass='full'"><xsl:attribute name="class">widthFull</xsl:attribute></xsl:if>
    <xsl:if test="@widthclass='wide'"><xsl:attribute name="class">widthWide</xsl:attribute></xsl:if>
    <xsl:if test="not(@widthclass='full' or @widthclass='wide')"><xsl:attribute name="class">widthAuto</xsl:attribute></xsl:if>
	  <xsl:attribute name="src">
		  <xsl:value-of select="dbk:imagedata[1]/@fileref" />
	  </xsl:attribute>
	</img>
</xsl:template>

<!-- pass through all MathML, dropping the namespace, except for the top element where we need the xmlns -->
<xsl:template match="m:math">
  <math>
    <xsl:attribute name="xmlns">http://www.w3.org/1998/Math/MathML</xsl:attribute>
    <xsl:apply-templates select="@*|node()"/>
  </math>
</xsl:template>
<xsl:template match="m:*">
  <xsl:element name="{local-name()}" use-attribute-sets="name-list">
    <xsl:copy-of select="@*" />
    <xsl:apply-templates select="node()"/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
