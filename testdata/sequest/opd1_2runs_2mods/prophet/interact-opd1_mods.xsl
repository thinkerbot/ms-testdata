<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:pepx="http://regis-web.systemsbiology.net/pepXML">
<xsl:variable name="tab"><xsl:text>&#x09;</xsl:text></xsl:variable>
<xsl:variable name="newline"><xsl:text>
</xsl:text></xsl:variable><xsl:key name="search_engine" match="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine" use="."/><xsl:key name="libra_channels" match="/pepx:msms_pipeline_analysis/pepx:analysis_summary[@analysis='libra']/pepx:libra_summary/@channel_code" use="."/>
<xsl:variable name="libra_count" select="count(/pepx:msms_pipeline_analysis/pepx:analysis_summary[@analysis='libra']/pepx:libra_summary/@channel_code[generate-id()=generate-id(key('libra_channels',.)[1])])"/><xsl:template match="pepx:msms_pipeline_analysis">
     <xsl:variable name="search_engine" select="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine"/>
                <xsl:variable name="summaryxml" select="@summary_xml"/> 
                <xsl:variable name="run_count" select="count(pepx:msms_run_summary)"/>
                <xsl:variable name="pepproph_flag">
			<xsl:choose>
				<xsl:when test="pepx:analysis_summary[@analysis='peptideprophet']">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
	
		<xsl:variable name="asapratio_flag">
			<xsl:choose>
				<xsl:when test="pepx:analysis_summary[@analysis='asapratio']">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="xpress_flag">
			<xsl:choose>
				<xsl:when test="pepx:analysis_summary[@analysis='xpress']">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

                <xsl:variable name="pepproph_opts" select="/pepx:msms_pipeline_analysis/pepx:analysis_summary[@analysis='peptideprophet']/pepx:peptideprophet_summary/@options"/> 
                <xsl:variable name="watch_for1"> PI</xsl:variable>
                <xsl:variable name="watch_for2">PI</xsl:variable>
                <xsl:variable name="pI_flag">       
                        <xsl:choose>
				<xsl:when test="contains($pepproph_opts, $watch_for1) or 
                                                starts-with($pepproph_opts, $watch_for2)">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>

                </xsl:variable>
<HTML><BODY BGCOLOR="white" OnLoad="self.focus()"><PRE>
<HEAD><TITLE>Trans-Proteomic Pipeline pepXML Viewer (TPP v2.9 GALE rev.2, Build 200703091101)</TITLE></HEAD><table width="100%" border="3" BGCOLOR="#8FBC6F" style="font-family: 'Courier New', Courier, mono; font-size: 10pt;"><tr><td align="center">
<form method="GET" action="/tpp/cgi-bin/pepxml2html.pl">
<input type="submit" value="Restore Original"/>
<input type="hidden" name="restore" value="yes"/>
<input type="hidden" name="xmlfile" value="/work/tpp-data/interact-opd1_mods.xml"/>
</form></td><td align="center"><pre>Trans-Proteomic Pipeline pepXML Viewer<br/>TPP v2.9 GALE rev.2, Build 200703091101<br/></pre>A.Keller  2.23.05</td><td align="center"><form method="GET" target="Win1" action="/tpp/cgi-bin/pepxml2html.pl">
<pre><input type="submit" value="Write Displayed Data Subset to File" /><pre><xsl:value-of select="$newline"/></pre><input type="hidden" name="xmlfile" value="/work/tpp-data/interact-opd1_mods.xml"/>
<input type="hidden" name="min_pepprob" value="0"/><input type="hidden" name="show_groups" value="yes"/><xsl:if test="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine='SEQUEST'"></xsl:if><xsl:if test="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine='MASCOT'"></xsl:if><xsl:if test="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine='COMET'"></xsl:if>file name: <input type="text" name="outfile" value="" size="20" maxlength="100"/>.shtml</pre>
</form></td></tr></table><form method="GET" action="/tpp/cgi-bin/pepxml2html.pl"><table width="100%" border="3" BGCOLOR="#8FBC6F"><tr><td><pre><input type="submit" value="Filter / Sort / Discard checked entries" /><xsl:text>     </xsl:text><xsl:if test="pepx:dataset_derivation/@generation_no &gt;'0'"><a target="Win1" href="/tpp/cgi-bin/show_pepdataset_derivation.pl?xmlfile=/work/tpp-data/interact-opd1_mods.xml&amp;xslt=/bin/nice -19 /usr/bin/xsltproc">Dataset Derivation Info</a></xsl:if><xsl:text>     </xsl:text><a target="Win1" href="/tpp/cgi-bin/more_pepanal.pl?xmlfile=/work/tpp-data/interact-opd1_mods.xml&amp;xslt=/bin/nice -19 /usr/bin/xsltproc&amp;cgi_bin=/tpp/cgi-bin/&amp;shtml=yes">More Analysis Info</a><xsl:text>     </xsl:text><a target="Win1" href="/tpp/cgi-bin/show_pipeline_help.pl?help_dir=/tpp/html/">Help</a><br/><xsl:value-of select="$newline"/><xsl:text> </xsl:text>sort by: <input type="radio" name="sort" value="none" CHECKED="yes"/>index <input type="radio" name="sort" value="spectrum" />spectrum <input type="radio" name="sort" value="peptide" />peptide <input type="radio" name="sort" value="protein" />protein<xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='SEQUEST'"> <input type="radio" name="sort" value="SEQ_xcorr" />SEQUEST xcorr</xsl:if><xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='MASCOT'"> <input type="radio" name="sort" value="MAS_ionsc" />MASCOT ionscore</xsl:if><xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='COMET'"> <input type="radio" name="sort" value="COM_dotprod" />COMET dotproduct</xsl:if><xsl:if test="pepx:analysis_summary[@analysis='peptideprophet'] or pepx:analysis_summary[@analysis='xpress'] or pepx:analysis_summary[@analysis='asapratio']"><br/><xsl:value-of select="$newline"/><xsl:text>          </xsl:text><xsl:if test="pepx:analysis_summary[@analysis='peptideprophet']"> <input type="radio" name="sort" value="prob" />PeptideProphet<sup><small>TM</small></sup> probability</xsl:if><xsl:if test="pepx:analysis_summary[@analysis='xpress']"> <input type="radio" name="sort" value="xpress_desc" />xpress desc <input type="radio" name="sort" value="xpress_asc" />xpress asc</xsl:if><xsl:if test="pepx:analysis_summary[@analysis='asapratio']"> <input type="radio" name="sort" value="asap_desc" />asap desc <input type="radio" name="sort" value="asap_asc" />asap asc</xsl:if></xsl:if><br/><xsl:value-of select="$newline"/><xsl:text> </xsl:text><xsl:if test="pepx:analysis_summary[@analysis='peptideprophet']">min probability: <INPUT TYPE="text" NAME="min_prob" VALUE="" SIZE="3" MAXLENGTH="15"/><xsl:text>   </xsl:text></xsl:if>min num tol term: <INPUT TYPE="text" NAME="min_ntt" VALUE="" SIZE="1" MAXLENGTH="1"/><xsl:text>   </xsl:text>  exclude charge: <input type="checkbox" name="ex1" value="yes" />1+<input type="checkbox" name="ex2" value="yes" />2+<input type="checkbox" name="ex3" value="yes" />3+<input type="checkbox" name="ex4" value="yes" />others<xsl:text>   </xsl:text><br/><xsl:value-of select="$newline"/><br/><xsl:value-of select="$newline"/><xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='SEQUEST'"> SEQUEST results:   min xcorr: <INPUT TYPE="text" NAME="min_SEQ_xcorr" VALUE="" SIZE="3" MAXLENGTH="8"/>  min deltacn: <INPUT TYPE="text" NAME="min_SEQ_delta" VALUE="" SIZE="3" MAXLENGTH="8"/>  max sprank: <INPUT TYPE="text" NAME="max_SEQ_sprank" VALUE="" SIZE="3" MAXLENGTH="8"/><xsl:if test="count(pepx:msms_run_summary/pepx:search_summary/@search_engine[generate-id()=generate-id(key('search_engine',.)[1])])&gt;'1'">  exclude: <input type="checkbox" name="exclSEQ" value="yes" /></xsl:if><br/><xsl:value-of select="$newline"/></xsl:if><xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='MASCOT'"> MASCOT results:   min ionscore: <INPUT TYPE="text" NAME="min_MAS_ionscore" VALUE="" SIZE="3" MAXLENGTH="8"/>  ionscore &gt; identityscore: <input type="checkbox" name="min_MAS_idscore" value="yes" /><xsl:if test="count(pepx:msms_run_summary/pepx:search_summary/@search_engine[generate-id()=generate-id(key('search_engine',.)[1])])&gt;'1'">  exclude: <input type="checkbox" name="exclMAS" value="yes" /></xsl:if><br/><xsl:value-of select="$newline"/></xsl:if><xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='COMET'"> COMET results:   min dotproduct: <INPUT TYPE="text" NAME="min_COM_dotproduct" VALUE="" SIZE="3" MAXLENGTH="8"/>  min delta: <INPUT TYPE="text" NAME="min_COM_delta" VALUE="" SIZE="3" MAXLENGTH="8"/>  min zscore: <INPUT TYPE="text" NAME="min_COM_zscore" VALUE="" SIZE="3" MAXLENGTH="8"/><xsl:if test="count(pepx:msms_run_summary/pepx:search_summary/@search_engine[generate-id()=generate-id(key('search_engine',.)[1])])&gt;'1'">  exclude: <input type="checkbox" name="exclCOM" value="yes" /></xsl:if><br/><xsl:value-of select="$newline"/></xsl:if><xsl:if test="pepx:analysis_summary[@analysis='xpress']"> exclude w/o XPRESS Ratio: <INPUT TYPE="checkbox" NAME="filter_xpress" VALUE="yes" /> min XPRESS Ratio: <INPUT TYPE="text" NAME="min_xpress" VALUE="" SIZE="3" MAXLENGTH="8"/>  max XPRESS Ratio: <INPUT TYPE="text" NAME="max_xpress" VALUE="" SIZE="3" MAXLENGTH="8"/><xsl:if test="pepx:analysis_summary[@analysis='asapratio']">  ASAPRatio consistent: <input type="checkbox" name="asap_xpress" value="yes" /></xsl:if><br/><xsl:value-of select="$newline"/></xsl:if><xsl:if test="pepx:analysis_summary[@analysis='asapratio']"> exclude w/o ASAP Ratio: <INPUT TYPE="checkbox" NAME="filter_asap" VALUE="yes" /> min ASAP Ratio: <INPUT TYPE="text" NAME="min_asap" VALUE="" SIZE="3" MAXLENGTH="8"/>  max ASAP Ratio: <INPUT TYPE="text" NAME="max_asap" VALUE="" SIZE="3" MAXLENGTH="8"/><br/><xsl:value-of select="$newline"/></xsl:if><xsl:if test="pepx:analysis_summary[@analysis='database_refresh']"><xsl:text> </xsl:text>proteins: <input type="radio" name="show_prots" value="hide" CHECKED="yes"/>ref all <input type="radio" name="show_prots" value="show" />show all  </xsl:if>  <xsl:if test="pepx:analysis_summary[@analysis='libra'] and $libra_count='1'"><xsl:text> </xsl:text>Libra Quantitation: <input type="radio" name="libra_display" value="absolute" CHECKED="yes"/>absolute <input type="radio" name="libra_display" value="normalized" />normalized  <br/><xsl:value-of select="$newline"/></xsl:if><xsl:text> </xsl:text>search scores: <input type="radio" name="show_search_scores" value="show" CHECKED="yes"/>show  <input type="radio" name="show_search_scores" value="hide" />hide  <xsl:text> </xsl:text>Pep3D menu: <input type="radio" name="show_pep3d" value="show" />show  <input type="radio" name="show_pep3d" value="hide" CHECKED="yes"/>hide  <xsl:if test="count(pepx:msms_run_summary/pepx:search_summary/@search_engine[generate-id()=generate-id(key('search_engine',.)[1])])&gt;'1'"><br/><xsl:value-of select="$newline"/> label search scores: generic:<INPUT TYPE="RADIO" NAME="score_display" VALUE="generic" CHECKED="yes"/><xsl:for-each select="pepx:msms_run_summary/pepx:search_summary/@search_engine[generate-id()=generate-id(key('search_engine',.)[1])]"><xsl:text>  </xsl:text><xsl:variable name="self" select="."/><xsl:value-of select="."/>:<INPUT TYPE="RADIO" NAME="score_display" VALUE="{$self}"/></xsl:for-each></xsl:if><br/><xsl:value-of select="$newline"/><xsl:text> </xsl:text>include aa: <INPUT TYPE="text" NAME="pep_aa" VALUE="" SIZE="5" MAXLENGTH="15"/>   mark aa: <INPUT TYPE="text" NAME="mark_aa" VALUE="" SIZE="5" MAXLENGTH="15"/>   NxS/T: <input type="checkbox" name="glyc" value="yes" /><xsl:text>   </xsl:text>spectrum text: <input type="text" name="text1" value="" size="12" maxlength="24"/><xsl:text>   </xsl:text>export to excel: <input type="checkbox" name="excel" value="yes" />
<input type="hidden" name="restore" value="no"/>
<input type="hidden" name="xmlfile" value="/work/tpp-data/interact-opd1_mods.xml"/>
<input type="hidden" name="exclusions" value=""/>
<input type="hidden" name="inclusions" value=""/>
<input type="hidden" name="pexclusions" value=""/>
<input type="hidden" name="pinclusions" value=""/>
<pre><xsl:value-of select="$newline"/></pre><br/><xsl:value-of select="$newline"/> full menu <input type="checkbox" name="full_menu" value="yes"/>        show discarded entries <input type="checkbox" name="discards" value="yes" />      clear manual discards/restores <input type="checkbox" name="clear" value="yes"/><xsl:value-of select="$newline"/><xsl:if test="pepx:analysis_summary[@analysis='xpress'] or pepx:analysis_summary[@analysis='asapratio']"><input type="hidden" name="quant_light2heavy" value="true"/></xsl:if><input type="hidden" name="asap" value=""/><input type="hidden" name="xpress" value=""/><input type="hidden" name="enzyme" value=""/><input type="hidden" name="peptide_mass" value=""/><input type="hidden" name="ntt" value=""/><input type="hidden" name="group_number" value=""/><input type="hidden" name="scores" value=""/><input type="hidden" name="spectrum" value=""/><input type="hidden" name="prot_number" value=""/><input type="hidden" name="ions" value=""/><input type="hidden" name="pI_zscore" value=""/><input type="hidden" name="probability" value=""/><input type="hidden" name="libra" value=""/><input type="hidden" name="pI" value=""/><input type="hidden" name="protein" value=""/><input type="hidden" name="peptide_sequence" value=""/><input type="hidden" name="index" value=""/><input type="hidden" name="fval" value=""/><input type="hidden" name="massdiff" value=""/><xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='SEQUEST'"><input type="hidden" name="xcorr" value=""/><input type="hidden" name="deltacn" value=""/><input type="hidden" name="sprank" value=""/><input type="hidden" name="spscore" value=""/></xsl:if><xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='MASCOT'"><input type="hidden" name="ionscore" value=""/><input type="hidden" name="idscore" value=""/><input type="hidden" name="homologyscore" value=""/></xsl:if><xsl:if test="pepx:msms_run_summary/pepx:search_summary/@search_engine='COMET'"><input type="hidden" name="dotproduct" value=""/><input type="hidden" name="delta" value=""/><input type="hidden" name="zscore" value=""/></xsl:if><input type="hidden" name="num_unique_peps" value="show"/><input type="hidden" name="tot_num_peps" value="show"/><input type="hidden" name="xpress_display" value="show"/>
<input type="hidden" name="asap_display" value="show"/>
</pre></td></tr></table>
<font color="red"><xsl:value-of select="count(pepx:msms_run_summary/pepx:spectrum_query/pepx:search_result/pepx:search_hit[(@hit_rank='1')])"/> entries retrieved from <A href="/work/tpp-data/interact-opd1_mods.xml"><font color="red">/work/tpp-data/interact-opd1_mods.xml</font></A></font><br/><xsl:value-of select="$newline"/><pre><br/><xsl:value-of select="$newline"/></pre><table cellpadding="2" bgcolor="white" style="font-family: 'Courier New', Courier, mono; font-size: 10pt;">
<xsl:comment>start</xsl:comment><br/><xsl:value-of select="$newline"/>
<tr><td><font color="brown"><b>index</b></font><xsl:text>     </xsl:text></td><xsl:if test="$pepproph_flag='true'"><td><font color="brown"><b>prob</b></font><xsl:text>     </xsl:text></td></xsl:if><td><font color="brown"><b>spectrum</b></font><xsl:text>     </xsl:text></td><td><table cellpadding="2" bgcolor="white" style="font-family: 'Courier New', Courier, mono; font-size: 10pt;"><TR><xsl:if test="count(pepx:msms_run_summary/pepx:search_summary/@search_engine[generate-id()=generate-id(key('search_engine',.)[1])])='1'"><xsl:choose><xsl:when test="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine='SEQUEST'"><td><font color="brown"><b>xcorr</b></font></td><td><font color="brown"><b>deltacn</b></font></td><td><font color="brown"><b>sprank</b></font></td></xsl:when><xsl:when test="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine='MASCOT'"><td width="50"><font color="brown"><b>ionscore</b></font></td><td width="50"><font color="brown"><b>id score</b></font></td><td width="50"><font color="brown"><b>homology score</b></font></td></xsl:when><xsl:when test="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine='COMET'"><td width="50"><font color="brown"><b>dot product</b></font></td><td width="50"><font color="brown"><b>delta</b></font></td><td width="50"><font color="brown"><b>zscore</b></font></td></xsl:when><xsl:when test="/pepx:msms_pipeline_analysis/pepx:msms_run_summary/pepx:search_summary/@search_engine='PROBID'"><td><font color="brown"><b>bays score</b></font></td><td><font color="brown"><b>zscore</b></font></td></xsl:when><xsl:otherwise><font color="brown"><b>search scores</b></font></xsl:otherwise></xsl:choose></xsl:if><xsl:if test="count(pepx:msms_run_summary/pepx:search_summary/@search_engine[generate-id()=generate-id(key('search_engine',.)[1])])&gt;'1'"><td><font color="brown"><b>search scores</b></font></td></xsl:if></TR></table></td><td><font color="brown"><b>m ions</b></font><xsl:text>     </xsl:text></td><xsl:if test="$libra_count='1'"><xsl:for-each select="/pepx:msms_pipeline_analysis/pepx:analysis_summary[@analysis='libra']/pepx:libra_summary/pepx:fragment_masses"><td><font color="brown"><b>libra <xsl:value-of select="@mz"/></b></font><xsl:text>     </xsl:text></td></xsl:for-each></xsl:if><td><font color="brown"><b>peptide</b></font><xsl:text>     </xsl:text></td><td><font color="brown"><b>protein</b></font><xsl:text>     </xsl:text></td><xsl:if test="$xpress_flag='true'"><td><font color="brown"><b>xpress</b></font><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$asapratio_flag='true'"><td><font color="brown"><b>asapratio</b></font><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$pepproph_flag='true'"><td><font color="brown"><b>fval</b></font><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$pI_flag='true'"><td><font color="brown"><b>pI</b></font><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$pI_flag='true'"><td><font color="brown"><b>pI z-score</b></font><xsl:text>     </xsl:text></td></xsl:if></tr>
<xsl:apply-templates select="/pepx:msms_pipeline_analysis/pepx:msms_run_summary">
		     <xsl:with-param name="summaryxml" select="$summaryxml"/>
                     <xsl:with-param name="pepproph_flag" select="$pepproph_flag"/>
		     <xsl:with-param name="asapratio_flag" select="$asapratio_flag"/>
		     <xsl:with-param name="xpress_flag" select="$xpress_flag"/>	
</xsl:apply-templates>
</table>
</form></PRE></BODY></HTML>
</xsl:template>
<xsl:template match="pepx:msms_run_summary">	
		<xsl:param name="pepproph_flag"/>
		<xsl:param name="asapratio_flag"/>
		<xsl:param name="xpress_flag"/>
		<xsl:param name="summaryxml"/>
				
		<xsl:variable name="asap_time" select="pepx:analysis_timestamp[@analysis='asapratio']/@time" />
		<xsl:variable name="basename" select="@base_name"/>
		<xsl:variable name="enzyme" select="pepx:sample_enzyme/@name" />	
		<xsl:variable name="xpress_display" select="pepx:analysis_timestamp[@analysis='xpress']/pepx:xpressratio_timestamp/@xpress_light" />
		<xsl:variable name="pepproph_timestamp" select="pepx:analysis_timestamp[@analysis='peptideprophet']/@time" />
		<xsl:variable name="search_engine" select="pepx:search_summary/@search_engine"/>
        
        <xsl:variable name="dbrefresh_flag">
			<xsl:choose>
				<xsl:when test="pepx:analysis_timestamp[@analysis='database_refresh']">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="Database">
			<xsl:choose>
				<xsl:when test="pepx:analysis_timestamp[@analysis='database_refresh']">
					<xsl:value-of select="pepx:analysis_timestamp[@analysis='database_refresh']/pepx:database_refresh_timestamp/@database" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="pepx:search_summary/pepx:search_database/@local_path" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="minntt">
			<xsl:choose>
				<xsl:when test="pepx:search_summary/pepx:enzymatic_search_constraint and pepx:search_summary/pepx:enzymatic_search_constraint/@enzyme=pepx:sample_enzyme/@name">
					<xsl:value-of select="pepx:search_summary/pepx:enzymatic_search_constraint/@min_number_termini" />
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="comet_md5_check_sum">
			<xsl:if test="pepx:search_summary/@search_engine='COMET'">
				<xsl:value-of select="pepx:search_summary/pepx:parameter[@name='md5_check_sum']/@value" />
			</xsl:if>
		</xsl:variable>
		
		<xsl:variable name="aa_mods">
			<xsl:for-each select="pepx:search_summary/pepx:aminoacid_modification"><xsl:value-of select="@aminoacid" />
				<xsl:if test="@symbol">
					<xsl:value-of select="@symbol" />
				</xsl:if>-
				<xsl:value-of select="@mass" />:
			</xsl:for-each>
		</xsl:variable>
		
		<xsl:variable name="term_mods">
			<xsl:for-each select="pepx:search_summary/pepx:terminal_modification"><xsl:value-of select="@terminus" />
				<xsl:if test="@symbol">
					<xsl:value-of select="@symbol" />
				</xsl:if>-
				<xsl:value-of select="@mass" />:
			</xsl:for-each>
		</xsl:variable>
		
		<xsl:variable name="masstype">
			<xsl:choose>
				<xsl:when test="pepx:search_summary/@precursor_mass_type='average'">0</xsl:when>
			    <xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>		
		
		<xsl:apply-templates select="pepx:spectrum_query">
		        <xsl:with-param name="summaryxml" select="$summaryxml"/>
			<xsl:with-param name="basename" select="$basename"/>
			<xsl:with-param name="enzyme" select="$enzyme"/>
			<xsl:with-param name="aa_mods" select="$aa_mods"/>
			<xsl:with-param name="term_mods" select="$term_mods"/>
			<xsl:with-param name="xpress_display" select="$xpress_display"/>
			<xsl:with-param name="asap_time" select="$asap_time"/>
			<xsl:with-param name="Database" select="$Database"/>
			<xsl:with-param name="minntt" select="$minntt"/>
			<xsl:with-param name="masstype" select="$masstype"/>
			<xsl:with-param name="search_engine" select="$search_engine"/>
			<xsl:with-param name="pepproph_timestamp" select="$pepproph_timestamp"/>
			<xsl:with-param name="comet_md5_check_sum" select="$comet_md5_check_sum"/>
			<xsl:with-param name="pepproph_flag" select="$pepproph_flag"/>
			<xsl:with-param name="asapratio_flag" select="$asapratio_flag"/>
			<xsl:with-param name="xpress_flag" select="$xpress_flag"/>	
			<xsl:with-param name="dbrefresh_flag" select="$dbrefresh_flag"/>
</xsl:apply-templates>
</xsl:template>
<xsl:template match="pepx:spectrum_query">
<xsl:param name="enzyme">
			<xsl:value-of select="parent::node()/pepx:sample_enzyme/@name" />
		</xsl:param>
		<xsl:param name="basename">
			<xsl:value-of select="parent::node()/@base_name" />
		</xsl:param>
		<xsl:param name="pepproph_timestamp">
			<xsl:value-of select="parent::node()/pepx:analysis_timestamp[@analysis='peptideprophet']/@time" />
		</xsl:param>
		<xsl:param name="xpress_display">
			<xsl:value-of select="parent::node()/pepx:analysis_timestamp[@analysis='xpress']/pepx:xpressratio_timestamp/@xpress_light" />
		</xsl:param>
		<xsl:param name="search_engine">
			<xsl:value-of select="parent::node()/pepx:search_summary/@search_engine" />
		</xsl:param>
		<xsl:param name="dbrefresh_flag">
			<xsl:choose>
				<xsl:when test="parent::node()/pepx:analysis_timestamp[@analysis='database_refresh']">
					<xsl:value-of select="true()" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="Database">		
			<xsl:choose>
				<xsl:when test="parent::node()/pepx:analysis_timestamp[@analysis='database_refresh']">
					<xsl:value-of select="parent::node()/pepx:analysis_timestamp[@analysis='database_refresh']/pepx:database_refresh_timestamp/@database" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="parent::node()/pepx:search_summary/pepx:search_database/@local_path" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="minntt">
			<xsl:choose>
				<xsl:when test="parent::node()/pepx:search_summary/pepx:enzymatic_search_constraint and parent::node()/pepx:search_summary/pepx:enzymatic_search_constraint/@enzyme=parent::node()/pepx:sample_enzyme/@name">
					<xsl:value-of select="parent::node()/pepx:search_summary/pepx:enzymatic_search_constraint/@min_number_termini" />
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:param>
		<xsl:param name="comet_md5_check_sum">
			<xsl:if test="parent::node()/pepx:search_summary/@search_engine='COMET'">
				<xsl:value-of select="parent::node()/pepx:search_summary/pepx:parameter[@name='md5_check_sum']/@value" />
			</xsl:if>
		</xsl:param>
		<xsl:param name="aa_mods">
			<xsl:for-each select="parent::node()/pepx:search_summary/pepx:aminoacid_modification"><xsl:value-of select="@aminoacid" />
				<xsl:if test="@symbol">
					<xsl:value-of select="@symbol" />
				</xsl:if>-
				<xsl:value-of select="@mass" />:
			</xsl:for-each>
		</xsl:param>
		<xsl:param name="term_mods">			
			<xsl:for-each select="parent::node()/pepx:search_summary/pepx:terminal_modification"><xsl:value-of select="@terminus" />
				<xsl:if test="@symbol">
					<xsl:value-of select="@symbol" />
				</xsl:if>-
				<xsl:value-of select="@mass" />:
			</xsl:for-each>
		</xsl:param>
		<xsl:param name="asap_time">
			<xsl:value-of select="parent::node()/pepx:analysis_timestamp[@analysis='asapratio']/@time" />
		</xsl:param>
		<xsl:param name="masstype">
			<xsl:choose>
				<xsl:when test="parent::node()/pepx:search_summary/@precursor_mass_type='average'">0</xsl:when>
				<xsl:otherwise>1</xsl:otherwise>
			</xsl:choose>
		</xsl:param>		
		
		
		<xsl:param name="pepproph_flag" />
		<xsl:param name="asapratio_flag" />
		<xsl:param name="xpress_flag" />
		<xsl:param name="summaryxml" />                 
                <xsl:variable name="pI_flag">
			<xsl:choose>
				<xsl:when test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/pepx:search_score_summary/pepx:parameter[@name='pI']">
					<xsl:value-of select="true()"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="false()"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
<xsl:variable name="light_first_scan" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']/pepx:xpressratio_result/@light_firstscan"/><xsl:variable name="light_last_scan" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']/pepx:xpressratio_result/@light_lastscan"/><xsl:variable name="heavy_first_scan" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']/pepx:xpressratio_result/@heavy_firstscan"/><xsl:variable name="heavy_last_scan" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']/pepx:xpressratio_result/@heavy_lastscan"/><xsl:variable name="xpress_charge" select="@assumed_charge"/><xsl:variable name="LightMass" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']/pepx:xpressratio_result/@light_mass"/><xsl:variable name="HeavyMass" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']/pepx:xpressratio_result/@heavy_mass"/><xsl:variable name="MassTol" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']/pepx:xpressratio_result/@mass_tol"/><xsl:variable name="xpress_index" select="@index"/><xsl:variable name="xpress_spec" select="@spectrum"/><xsl:variable name="index" select="@index"/><xsl:variable name="Peptide" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide"/><xsl:variable name="StrippedPeptide" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide"/><xsl:variable name="Protein" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@protein"/><xsl:variable name="calc_pI" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@calc_pI"/><xsl:variable name="pep_mass" select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@calc_neutral_pep_mass"/><xsl:variable name="PeptideMods"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_nterm_mass">n[<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_nterm_mass"/>]</xsl:if><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_cterm_mass">c[<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_cterm_mass"/>]</xsl:if><xsl:for-each select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/pepx:mod_aminoacid_mass"><xsl:value-of select="@position"/>[<xsl:value-of select="@mass"/>]</xsl:for-each></xsl:if></xsl:variable><xsl:variable name="PeptideMods2"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_nterm_mass">ModN=<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_nterm_mass"/>&amp;</xsl:if><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_cterm_mass">ModC=<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_cterm_mass"/>&amp;</xsl:if><xsl:for-each select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/pepx:mod_aminoacid_mass">Mod<xsl:value-of select="@position"/>=<xsl:value-of select="@mass"/>&amp;</xsl:for-each></xsl:if></xsl:variable><xsl:variable name="prob"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/@probability"/><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/@analysis='adjusted'">a</xsl:if></xsl:variable><xsl:variable name="scores"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/pepx:search_score_summary"><xsl:for-each select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/pepx:search_score_summary/pepx:parameter"><xsl:value-of select="@name"/>:<xsl:value-of select="@value"/><xsl:text> </xsl:text></xsl:for-each></xsl:if></xsl:variable><tr><td><nobr><input type="checkbox" name="excl{$index}" style="height: 15px; width: 15px;" value="yes"/> <xsl:value-of select="@index"/><xsl:text> </xsl:text></nobr></td><xsl:if test="$pepproph_flag='true'"><td><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']"><A TARGET="Win1" HREF="/tpp/cgi-bin/ModelParser.cgi?Xmlfile={$summaryxml}&amp;Xslt=/bin/nice -19 /usr/bin/xsltproc&amp;Timestamp={$pepproph_timestamp}&amp;Spectrum={$xpress_spec}&amp;Scores={$scores}&amp;Prob={$prob}"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/@analysis and pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/@analysis='adjusted'"><font color="#FF00FF"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/@probability"/></font></xsl:if><xsl:if test="not(pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/@analysis) or not(pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/@analysis='adjusted')"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/@probability"/></xsl:if></A></xsl:if><xsl:if test="not(pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet'])">N_A</xsl:if><xsl:text>     </xsl:text></td></xsl:if><td><xsl:choose><xsl:when test="$search_engine='SEQUEST' or $search_engine='PROBID'"><A TARGET="Win1" HREF="/tpp/cgi-bin/sequest-tgz-out.cgi?OutFile={$basename}/{$xpress_spec}.out"><xsl:value-of select="@spectrum"/></A></xsl:when><xsl:when test="$search_engine='MASCOT'"><A TARGET="Win1" HREF="/tpp/cgi-bin/mascotout.pl?OutFile={$basename}/{$xpress_spec}.out"><xsl:value-of select="@spectrum"/></A></xsl:when><xsl:when test="$search_engine='COMET'"><A TARGET="Win1" HREF="/tpp/cgi-bin/cometresult.cgi?TarFile={$basename}.cmt.tar.gz&amp;File={$xpress_spec}.cmt"><xsl:value-of select="@spectrum"/></A></xsl:when><xsl:otherwise><xsl:value-of select="@spectrum"/></xsl:otherwise></xsl:choose><xsl:text>     </xsl:text></td><td><table cellpadding="2" bgcolor="white" style="font-family: 'Courier New', Courier, mono; font-size: 10pt;"><TR><xsl:if test="$search_engine='SEQUEST'"><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='xcorr']/@value"/><xsl:text>     </xsl:text></td><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='deltacn']/@value"/><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='deltacnstar']/@value='1'">*</xsl:if><xsl:text>     </xsl:text></td><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='sprank']/@value"/><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$search_engine='MASCOT'"><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='ionscore']/@value"/><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='star']/@value='1'">*</xsl:if><xsl:text>     </xsl:text></td><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='identityscore']/@value"/><xsl:text>     </xsl:text></td><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='homologyscore']/@value"/><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$search_engine='COMET'"><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='dotproduct']/@value"/><xsl:text>     </xsl:text></td><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='delta']/@value"/><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='deltastar']/@value='1'">*</xsl:if><xsl:text>     </xsl:text></td><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='zscore']/@value"/><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$search_engine='PROBID'"><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='bays_score']/@value"/><xsl:text>     </xsl:text></td><td width="50" align="right"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/pepx:search_score[@name='z_score']/@value"/><xsl:text>     </xsl:text></td></xsl:if></TR></table></td><td align="RIGHT"><xsl:choose><xsl:when test="$search_engine='COMET'"><A TARGET="Win1" HREF="/tpp/cgi-bin/plot-msms.cgi?MassType={$masstype}&amp;NumAxis=1&amp;{$PeptideMods2}Pep={$StrippedPeptide}&amp;Dta={$basename}/{$xpress_spec}.dta&amp;COMET=1"><nobr><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@num_matched_ions"/>/<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@tot_num_ions"/></nobr></A></xsl:when><xsl:otherwise><A TARGET="Win1" HREF="/tpp/cgi-bin/plot-msms.cgi?MassType={$masstype}&amp;NumAxis=1&amp;{$PeptideMods2}Pep={$StrippedPeptide}&amp;Dta={$basename}/{$xpress_spec}.dta"><nobr><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@num_matched_ions"/>/<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@tot_num_ions"/></nobr></A></xsl:otherwise></xsl:choose><xsl:text>     </xsl:text></td><xsl:if test="$libra_count='1'"><xsl:for-each select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='libra']/pepx:libra_result/pepx:intensity"><td><xsl:value-of select="@absolute"/><xsl:text>     </xsl:text></td></xsl:for-each></xsl:if><td nowrap="TRUE"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide_prev_aa"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide_prev_aa"/>.</xsl:if><A TARGET="Win1" HREF="http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Web&amp;LAYOUT=TwoWindows&amp;AUTO_FORMAT=Semiauto&amp;ALIGNMENTS=50&amp;ALIGNMENT_VIEW=Pairwise&amp;CDD_SEARCH=on&amp;CLIENT=web&amp;COMPOSITION_BASED_STATISTICS=on&amp;DATABASE=nr&amp;DESCRIPTIONS=100&amp;ENTREZ_QUERY=(none)&amp;EXPECT=1000&amp;FILTER=L&amp;FORMAT_OBJECT=Alignment&amp;FORMAT_TYPE=HTML&amp;I_THRESH=0.005&amp;MATRIX_NAME=BLOSUM62&amp;NCBI_GI=on&amp;PAGE=Proteins&amp;PROGRAM=blastp&amp;SERVICE=plain&amp;SET_DEFAULTS.x=41&amp;SET_DEFAULTS.y=5&amp;SHOW_OVERVIEW=on&amp;END_OF_HTTPGET=Yes&amp;SHOW_LINKOUT=yes&amp;QUERY={$StrippedPeptide}"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@modified_peptide"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@modified_peptide"/></xsl:if><xsl:if test="not(pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@modified_peptide)"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide"/><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_nterm_mass">n[<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_nterm_mass"/>]</xsl:if><xsl:for-each select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/pepx:mod_aminoacid_mass"><xsl:value-of select="@position"/>[<xsl:value-of select="@mass"/>]</xsl:for-each><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_cterm_mass">c[<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info/@mod_cterm_mass"/>]</xsl:if></xsl:if></xsl:if><xsl:if test="not(pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:modification_info)"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide"/></xsl:if></A><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide_next_aa">.<xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide_next_aa"/></xsl:if><xsl:text>     </xsl:text><A TARGET="Win1" HREF="https://db.systemsbiology.net/sbeams/cgi/PeptideAtlas/Search?organism_name=Human;search_key=%25{$StrippedPeptide}%25;action=GO"><IMG BORDER="0" SRC="/tpp/html/pa_tiny.png"/></A><xsl:text>     </xsl:text></td><td><A TARGET="Win1" HREF="/tpp/cgi-bin/comet-fastadb.cgi?Db={$Database}&amp;Pep={pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide}&amp;MassType={$masstype}&amp;sample_enzyme={$enzyme}&amp;min_ntt={$minntt}"><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank = '1']/@protein"/></A><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/@num_tot_proteins &gt; 1"><xsl:if test="$dbrefresh_flag='true'"><xsl:text> </xsl:text><A TARGET="Win1" HREF="/tpp/cgi-bin/comet-fastadb.cgi?Db={$Database}&amp;Pep={pepx:search_result/pepx:search_hit[@hit_rank='1']/@peptide}&amp;MassType={$masstype}&amp;sample_enzyme={$enzyme}&amp;min_ntt={$minntt}">+<xsl:value-of select="number(pepx:search_result/pepx:search_hit[@hit_rank='1']/@num_tot_proteins)-1"/></A></xsl:if></xsl:if></td><xsl:if test="$xpress_flag='true'"><td><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']"><A TARGET="Win1" HREF="/tpp/cgi-bin/XPressPeptideUpdateParser.cgi?LightFirstScan={$light_first_scan}&amp;LightLastScan={$light_last_scan}&amp;HeavyFirstScan={$heavy_first_scan}&amp;HeavyLastScan={$heavy_last_scan}&amp;XMLFile={$basename}.mzXML&amp;ChargeState={$xpress_charge}&amp;LightMass={$LightMass}&amp;HeavyMass={$HeavyMass}&amp;MassTol={$MassTol}&amp;index={$xpress_index}&amp;xmlfile=/work/tpp-data/interact-opd1_mods.xml&amp;OutFile={$xpress_spec}&amp;bXpressLight1={$xpress_display}"><nobr><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='xpress']/pepx:xpressratio_result/@ratio"/></nobr></A></xsl:if></td></xsl:if><xsl:if test="$asapratio_flag='true'"><td><A TARGET="Win1" HREF="/tpp/cgi-bin/ASAPRatioPeptideCGIDisplayParser.cgi?Xmlfile=/work/tpp-data/interact-opd1_mods.xml&amp;Basename={$basename}&amp;Indx={$xpress_index}&amp;Timestamp={$asap_time}&amp;Spectrum={$xpress_spec}&amp;ratioType=0"><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@mean&lt;'0'">N_A</xsl:if><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@mean&gt;'-1'"><xsl:choose><xsl:when test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@mean='0' or pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@mean='999' or pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@error &gt; 0.5 * pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@mean"><font color="red"><nobr><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@mean"/><xsl:text> </xsl:text> +-<xsl:text> </xsl:text><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@error"/></nobr></font></xsl:when><xsl:otherwise><nobr><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@mean"/><xsl:text> </xsl:text> +-<xsl:text> </xsl:text><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='asapratio']/pepx:asapratio_result/@error"/></nobr></xsl:otherwise></xsl:choose></xsl:if></A></td></xsl:if><xsl:if test="$pepproph_flag='true'"><td><xsl:if test="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/pepx:search_score_summary"><nobr><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/pepx:search_score_summary/pepx:parameter[@name='fval']/@value"/></nobr></xsl:if><xsl:if test="not(pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/pepx:search_score_summary)">N_A</xsl:if><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$pI_flag='true'"><td><nobr><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/pepx:search_score_summary/pepx:parameter[@name='pI']/@value"/></nobr><xsl:text>     </xsl:text></td></xsl:if><xsl:if test="$pI_flag='true'"><td><nobr><xsl:value-of select="pepx:search_result/pepx:search_hit[@hit_rank='1']/pepx:analysis_result[@analysis='peptideprophet']/pepx:peptideprophet_result/pepx:search_score_summary/pepx:parameter[@name='pI_zscore']/@value"/></nobr><xsl:text>     </xsl:text></td></xsl:if></tr></xsl:template>
</xsl:stylesheet>

