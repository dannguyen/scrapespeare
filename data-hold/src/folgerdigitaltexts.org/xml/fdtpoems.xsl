<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
  exclude-result-prefixes="xd exsl estr edate a fo local rng tei teix"
  extension-element-prefixes="exsl estr edate" version="1.0"
  xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:edate="http://exslt.org/dates-and-times"
  xmlns:estr="http://exslt.org/strings" xmlns:exsl="http://exslt.org/common"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:html="http://www.w3.org/1999/xhtml"
  xmlns:local="http://www.pantor.com/ns/local"
  xmlns:rng="http://relaxng.org/ns/structure/1.0"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:teix="http://www.tei-c.org/ns/Examples"
  xmlns:xd="http://www.pnp-software.com/XSLTdoc"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xd:doc type="stylesheet">
    <xd:short> TEI stylesheet for Folger Digital Texts. </xd:short>
    <xd:detail> This library is free software; you can redistribute it and/or
      modify it under the terms of the GNU Lesser General Public License as
      published by the Free Software Foundation; either version 2.1 of the
      License, or (at your option) any later version. This library is
      distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
      without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
      PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
      details. You should have received a copy of the GNU Lesser General Public
      License along with this library; if not, write to the Free Software
      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA </xd:detail>
  </xd:doc>
  <xsl:output method="html" encoding="UTF-8"/>
<xsl:strip-space elements="*"/>
<xsl:preserve-space elements="tei:c"/>
  <xsl:template match="/">
	<html>
	<head>
	  <title><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<style type="text/css" media="screen,print">@import "fdt.css";</style>
  <script type="text/javascript">
    var smartCopyYN = true;
    function smartCopy() {
      if (smartCopyYN == false) return true;
      if (navigator.appVersion.indexOf("MSIE")!=-1) {
        document.getElementById('copyPaste').style.visibility = "hidden";
      }
      var html = "";
      var top = window.pageYOffset || document.documentElement.scrollTop;
      if (typeof window.getSelection != "undefined") {
        var sel = window.getSelection();
        if (sel.rangeCount) {
          var container = document.createElement("div");
          for (var i = 0, len = sel.rangeCount; i &lt; len; ++i) {
            container.appendChild(sel.getRangeAt(i).cloneContents());
          }
          html = container.innerHTML;
        }
      } else if (typeof document.selection != "undefined") {
        if (document.selection.type == "Text") {
          html = document.selection.createRange().htmlText;
        }
      }
      document.getElementById('copyPaste').innerHTML = html;
      cpObj = document.getElementById('copyPaste');
      var objs = cpObj.getElementsByTagName('a');
      for (var i = objs.length-1; i >= 0; i--) { objs[i].parentNode.removeChild(objs[i]); }
      var objs = cpObj.getElementsByTagName('hr');
      for (var i = objs.length-1; i >= 0; i--) { objs[i].parentNode.removeChild(objs[i]); }

      var objs = cpObj.getElementsByTagName('*');
      for (var i = objs.length-1; i >= 0; i--) { 
        if (objs[i].className) {
          var className = objs[i].className;
          var matchNodes = "ftln,lineNbr,pageHeading,actFooter";
          if (matchNodes.indexOf(className) != -1) {
            objs[i].parentNode.removeChild(objs[i]);
          } else if (className.indexOf('alignment') != -1) {
            objs[i].parentNode.removeChild(objs[i]);
          }
        }
      }
      if (window.getSelection) {
        window.getSelection().removeAllRanges();
        var range = document.createRange();
        range.selectNode(document.getElementById('copyPaste'));
        window.getSelection().addRange(range);
      } else if (document.selection) {
        document.selection.empty();
        var range = document.body.createTextRange();
        range.moveToElementText(document.getElementById('copyPaste'));
        range.select();
      }

      window.scrollTo(0,top);
    }

  </script>
	</head>
        <body onCopy="smartCopy();">
          <div id="copyPaste" style="top:0px;left:0px;width:1px;height:1px;overflow:hidden;"></div>
          <div id="pageBlock" class="pageBlock">
            <div class="textBlock">
	            <xsl:apply-templates/>
            </div>
          </div>
        </body>
        </html>
  </xsl:template>

  <xsl:template name="contents">
    <table class="contents">
    <tbody>
      <tr>
      <td class="act">Front Matter</td>
      <td>
        <a id="locFromTheDirector" href="#FromTheDirector" class="scene">From the Director of the Folger Shakespeare Library</a><br/>
        <a id="locTextualIntroduction" href="#TextualIntroduction" class="scene">Textual Introduction</a><br/>
      </td>
      </tr>
      <tr>
      <xsl:choose>
        <xsl:when test="//tei:div2[contains(@xml:id,'Son-')]">
        <td class="act" style="vertical-align:top">Sonnets</td>
        <td>
        <xsl:for-each select="//tei:body//tei:div2[contains(@xml:id,'Son-')]">
          <a id="loc{@xml:id}" href="#{@xml:id}" class="scene">
          <xsl:value-of select="@n"/>
          <xsl:text>: </xsl:text>
          <xsl:variable name="wid" select="concat(@n,'.1')"/>
          <xsl:for-each select="//tei:body//tei:*[@n=$wid]">
          <xsl:value-of select="."/>
          </xsl:for-each>
          <xsl:text>&#8230;</xsl:text>
          </a><br/>
        </xsl:for-each>
        </td>
      </xsl:when>
      <xsl:otherwise>
        <td class="act">
  	      <xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
        </td>
        <td>
        <xsl:if test="//tei:div1[@type='dedication']">
          <a id="locdedication" href="#dedication" class="scene">Dedication</a><br/>
        </xsl:if>
        <xsl:if test="//tei:div1[@type='argument']">
          <a id="locargument" href="#argument" class="scene">Argument</a><br/>
        </xsl:if>
        <a id="locpoem" href="#poem" class="scene">
          <xsl:value-of select="//tei:div1[not(@xml:id)][not(@type)]/tei:head"/>
        </a><br/>
        </td>
      </xsl:otherwise>
      </xsl:choose>
      </tr>
    </tbody>
    </table>
  </xsl:template>

  <xsl:template name="front">
    <xsl:apply-templates select="//tei:front/tei:div"/>
  </xsl:template>

  <xsl:template match="tei:del">
  </xsl:template>
  <xsl:template match="tei:app">
  </xsl:template>

  <xsl:variable name="rdg" select="'lemma'" />
  <xsl:variable name="emendDesc" select="//tei:interp[@xml:id='emend']" />

  <xsl:template match="tei:teiHeader">
    <xsl:apply-templates select="//tei:titleStmt"/>
  </xsl:template>
  <xsl:template match="tei:front">
  </xsl:template>
  <xsl:template match="tei:back">
  </xsl:template>

  <xsl:template match="tei:titleStmt">
    <div class="div1">
	  <xsl:variable name="id" select="//tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:idno"/>
	  <xsl:variable name="title" select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
    <img class="titleImg" src="{$id}titleblack.png" alt="{$title}"/>
    <div class="credits">
      <p>Folger Shakespeare Library</p>
      <p><a href="http://www.folgerdigitaltexts.org">http://www.folgerdigitaltexts.org</a></p>
    </div>
     <hr/>
    </div>
    <div id="contents" class="page div1">
     <div class="frontHeader">Contents</div>
     <xsl:call-template name="contents"/>
     <hr/>
    </div>
    <xsl:call-template name="front"/>
  </xsl:template>

  <xsl:template match="tei:front/tei:div[@type='FromTheDirector']">
    <div id="FromTheDirector" class="page div1">
     <a name="FromTheDirector"/>
     <div class="frontHeader">From the Director of the Folger Shakespeare Library</div>
     <xsl:apply-templates/>
     <hr/>
   </div>
  </xsl:template>
  <xsl:template match="tei:front/tei:div[@type='TextualIntroduction']">
    <div id="TextualIntroduction" class="page div1">
     <a name="TextualIntroduction"/>
     <div class="frontHeader">Textual Introduction<br/>By Barbara Mowat and Paul Werstine</div>
     <xsl:apply-templates/>
     <hr/>
   </div>
  </xsl:template>
  <xsl:template match="tei:front//tei:lb">
    <br/>
  </xsl:template>
  <xsl:template match="tei:front//tei:p">
    <p><xsl:apply-templates/></p>
  </xsl:template>
  <xsl:template match="tei:front//tei:title">
    <span class="italic"><xsl:apply-templates/></span>
  </xsl:template>
  <xsl:template match="tei:front//tei:opener">
    <div class="centered"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:front//tei:head">
    <div class="centered"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:closer">
    <p class="signed"><xsl:apply-templates/></p>
  </xsl:template>
  <xsl:template match="tei:front//tei:signed">
    <span class="italic"><xsl:apply-templates/></span>
  </xsl:template>
  <xsl:template match="tei:epigraph">
    <span class="italic"><xsl:apply-templates/></span>
  </xsl:template>
  <xsl:template match="tei:front//tei:graphic">
    <xsl:variable name="alt" select="./tei:desc" />
    <img src="{@url}" class="imgTextX" alt="{$alt}"/>
  </xsl:template>
  <xsl:template match="tei:front//tei:seg[@rend='nobr']">
    <span style="white-space:nowrap"><xsl:apply-templates/></span>
  </xsl:template>
  <xsl:template match="tei:trailer">
    <xsl:variable name="class" select="translate(@rend,',',' ')" />
    <br/>
    <br/>
    <div class="{$class}"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:head/tei:bibl">
    <div class="centered" style="margin:20px"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:div1/tei:note">
    <div class="centered" style="margin:20px"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:div2/tei:bibl">
    <br/>
    <div class="right"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:div2/tei:bibl/tei:citedRange">
    <xsl:text>[</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>]</xsl:text>
  </xsl:template>

  <xsl:template match="tei:lb">
     <br/>
  </xsl:template>

  <xsl:key name="actPage" match="tei:text/tei:body/tei:pb" use="substring(@spanTo,2)"/> 
  <xsl:key name="altRdg" match="tei:app[@from]" use="substring(@from,2)"/> 

  <xsl:key name="emend1" match="tei:div/tei:ab/tei:ptr[@type='emendation'][@ana='#emend']" use="substring(@target,2,8)"/> 
  <xsl:key name="emend2" match="tei:div/tei:ab/tei:ptr[@type='emendation'][@ana='#emend']" use="substring(@target,string-length(@target)-7)"/> 


  <xsl:template match="tei:div1">
     <xsl:choose>
     <xsl:when test="@type">
       <a name="{@type}"/>
     </xsl:when>
     <xsl:when test="@xml:id">
       <a name="{@xml:id}"/>
     </xsl:when>
     <xsl:otherwise>
       <a name="poem"/>
     </xsl:otherwise>
     </xsl:choose>
     <xsl:choose>
     <xsl:when test="@type='dedication'">
       <div class="size12pt"><xsl:apply-templates/></div>
     </xsl:when>
     <xsl:when test="@type='argument'">
       <div class="size12pt"><xsl:apply-templates/></div>
     </xsl:when>
     <xsl:otherwise>
       <div class="div1"><xsl:apply-templates/></div>
     </xsl:otherwise>
     </xsl:choose>
     <hr/>
  </xsl:template>
  <xsl:template match="tei:div1[@n]">
     <a name="Son-{@n}"/>
     <hr style="margin:50px"/>
     <div class="div1">
       <div class="page sceneHeader bold">
         <xsl:value-of select="@n"/>
       </div>
       <xsl:apply-templates/>
     </div>
  </xsl:template>

  <xsl:template match="tei:div1//tei:opener">
     <div class="sceneHeader"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:salute[@rend]">
    <xsl:variable name="class" select="translate(@rend,',',' ')" />
    <div class="{$class}"><xsl:apply-templates/></div>
    <br/>
    <br/>
  </xsl:template>
  <xsl:template match="tei:div1[@type='argument']//tei:head">
     <div class="sceneHeader"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:div1/tei:head">
     <div class="page poemHeader"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:div1/tei:head[@rend='quotes']">
    <div class="page poemHeader roman"><xsl:text>&#8220;</xsl:text><xsl:apply-templates/><xsl:text>&#8221;</xsl:text></div>
  </xsl:template>
  <xsl:template match="tei:div2">
     <a name="{@xml:id}"/>
     <div class="div1">
       <div class="page sceneHeader bold">
         <xsl:value-of select="@n"/>
       </div>
       <xsl:apply-templates/>
     </div>
     <hr style="margin:50px"/>
  </xsl:template>
  <xsl:template match="tei:div2/tei:head">
     <div class="page actHeader"><xsl:apply-templates/></div>
  </xsl:template>

  <xsl:template match="tei:w|tei:c|tei:pc|tei:w/tei:seg|tei:anchor">
    <xsl:variable name="class" select="translate(@rend,',',' ')" />
      <xsl:call-template name="openWordMarks"/>
      <xsl:call-template name="showRdg"/>
      <xsl:call-template name="closeWordMarks"/>
  </xsl:template>


  <xsl:template name="openWordMarks">
    <xsl:variable name="emend" select="key('emend1',@xml:id)"/> 
    <xsl:choose>
      <xsl:when test="(ancestor::tei:q[1]//tei:w|ancestor::tei:q[1]//tei:pc)/@xml:id = ./@xml:id and count($emend)">
        <xsl:variable name="q1" select="(ancestor::tei:q[1]//tei:w)[1]/@xml:id" />
        <xsl:choose>
        <xsl:when test="$emend[contains(@target,$q1)]"> 
          <img src="fdt-emend-l.png" class="imgEmend" alt="{$emendDesc}" title="{$emendDesc}"/>
          <xsl:call-template name="openQuote"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="openQuote"/>
          <img src="fdt-emend-l.png" class="imgEmend" alt="{$emendDesc}" title="{$emendDesc}"/>
        </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="count($emend)"> 
          <img src="fdt-emend-l.png" class="imgEmend" alt="{$emendDesc}" title="{$emendDesc}"/>
        </xsl:if>
        <xsl:call-template name="openQuote"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="closeWordMarks">
    <xsl:variable name="emend" select="key('emend2',@xml:id)"/> 
    <xsl:choose>
      <xsl:when test="(ancestor::tei:q[1]//tei:w|ancestor::tei:q[1]//tei:pc)[last()]/@xml:id = ./@xml:id and count($emend)">
        <xsl:variable name="q1" select="(ancestor::tei:q[1]//tei:w)[1]/@xml:id" />
        <xsl:choose>
        <xsl:when test="$emend[contains(@target,$q1)]"> 
          <xsl:call-template name="closeQuote"/>
          <img src="fdt-emend-r.png" class="imgEmend" alt="{$emendDesc}" title="{$emendDesc}"/>
        </xsl:when>
        <xsl:otherwise>
          <img src="fdt-emend-r.png" class="imgEmend" alt="{$emendDesc}" title="{$emendDesc}"/>
          <xsl:call-template name="closeQuote"/>
        </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="closeQuote"/>
        <xsl:if test="count($emend)"> 
          <img src="fdt-emend-r.png" class="imgEmend" alt="{$emendDesc}" title="{$emendDesc}"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="openQuote">
      <xsl:if test="(ancestor::tei:q[1]//tei:w|ancestor::tei:q[1]//tei:pc)[1]/@xml:id = ./@xml:id and (not(ancestor::tei:q[2]) or (ancestor::tei:q[2]//tei:w|ancestor::tei:q[2]//tei:pc)[1]/@xml:id = ./@xml:id)">
        <xsl:text>&#8220;</xsl:text>
      </xsl:if>
      <xsl:if test="(ancestor::tei:q[1]//tei:w|ancestor::tei:q[1]//tei:pc)[1]/@xml:id = ./@xml:id and ancestor::tei:q[2]">
        <xsl:text>&#8216;</xsl:text>
      </xsl:if>
  </xsl:template>

  <xsl:template name="closeQuote">
      <xsl:if test="(ancestor::tei:q[1]//tei:w|ancestor::tei:q[1]//tei:pc)[last()]/@xml:id = ./@xml:id and ancestor::tei:q[2]">
        <xsl:text>&#8217;</xsl:text>
      </xsl:if>
      <xsl:if test="(ancestor::tei:q[1]//tei:w|ancestor::tei:q[1]//tei:pc)[last()]/@xml:id = ./@xml:id and (not(ancestor::tei:q[2]) or (ancestor::tei:q[2]//tei:w|ancestor::tei:q[2]//tei:pc)[last()]/@xml:id = ./@xml:id)">
        <xsl:text>&#8221;</xsl:text>
      </xsl:if>
  </xsl:template>

  <xsl:template name="showTLN">
    <xsl:variable name="ftln" select="number(substring-after(@xml:id,'-'))"/>
    <a name="{@xml:id}"/>
    <xsl:choose>
    <xsl:when test="contains(@xml:id,'Son-') and (@n mod 4) = 0">
      <span class="lineNbr" name="{@xml:id}"><xsl:value-of select="@n"/></span>
    </xsl:when>
    <xsl:when test="not(contains(@xml:id,'Son-')) and ($ftln mod 5) = 0">
      <span class="lineNbr" name="{@xml:id}"><xsl:value-of select="$ftln"/></span>
    </xsl:when>
    <xsl:otherwise>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="showRdg">
    <xsl:choose>
    <xsl:when test="key('altRdg',@xml:id)">
      <xsl:variable name="xmlId" select="@xml:id"/>
      <xsl:choose>
      <xsl:when test="//tei:app[contains(@from,$xmlId)]/tei:rdg[contains(@wit,$rdg)]">
        <xsl:apply-templates select="//tei:app[contains(@from,$xmlId)]/tei:rdg[contains(@wit,$rdg)]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="tei:foreign">
     <span class="italic"><xsl:apply-templates/></span>
  </xsl:template>
  <xsl:template match="tei:label">
    <div class="centered"><xsl:apply-templates/></div>
  </xsl:template>
  <xsl:template match="tei:ab[@rend='italic']">
     <span class="italic"><xsl:apply-templates/></span>
  </xsl:template>

  <xsl:template match="tei:milestone[@unit='stanza']">
    <br/>
  </xsl:template>
  <xsl:template match="tei:milestone[@unit='line']">
    <br/>
    <xsl:call-template name="showTLN"/>
    <xsl:choose>
    <xsl:when test="@n='1' and ancestor::tei:q">
      <xsl:text>&#8220;</xsl:text>
      <xsl:if test="ancestor::tei:q[2]">
        <xsl:text> &#8216;</xsl:text>
      </xsl:if>
    </xsl:when>
    <xsl:when test="contains(@xml:id,'Son-099')">
      <xsl:if test="@n='14' or @n='15'">
        <span class="alignment" style="padding-left:10px;">&#160;</span>
      </xsl:if>
    </xsl:when>
    <xsl:when test="contains(@xml:id,'Son') and (@n='13' or @n='14')">
      <span class="alignment" style="padding-left:10px;">&#160;</span>
    </xsl:when>
    <xsl:when test="contains(@xml:id,'Luc') and (@n='6' or @n='7')">
      <span class="alignment" style="padding-left:10px;">&#160;</span>
    </xsl:when>
    <xsl:when test="contains(@xml:id,'Ven') and (@n='5' or @n='6')">
      <span class="alignment" style="padding-left:10px;">&#160;</span>
    </xsl:when>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
