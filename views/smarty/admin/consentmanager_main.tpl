[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]

<script type="text/javascript">
    <!--
    function editThis(sID)
    {
        var oTransfer = top.basefrm.edit.document.getElementById( "transfer" );
        oTransfer.oxid.value = '';
        oTransfer.cl.value = top.oxid.admin.getClass( sID );

        //forcing edit frame to reload after submit
        top.forceReloadingEditFrame();

        var oSearch = top.basefrm.list.document.getElementById( "search" );
        oSearch.oxid.value = sID;
        oSearch.updatenav.value = 1;
        oSearch.submit();
    }
    //-->
</script>

[{if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
    [{else}]
    [{assign var="readonly" value=""}]
    [{/if}]

[{cycle assign="_clear_" values=",2"}]

<form name="transfer" id="transfer" action="[{$oViewConf->getSelfLink()}]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="oxid" value="[{$oxid}]">
    <input type="hidden" name="cl" value="cmconsentmanager_main">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="actshop" value="[{$oViewConf->getActiveShopId()}]">
    <input type="hidden" name="updatenav" value="">
    <input type="hidden" name="editlanguage" value="[{$editlanguage}]">
</form>

<form name="myedit" id="myedit" action="[{$oViewConf->getSelfLink()}]" method="post">
    [{$oViewConf->getHiddenSid()}]
    <input type="hidden" name="cl" value="cmconsentmanager_main">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="oxid" value="[{$oxid}]">
    <input type="hidden" name="editval[oxshops__oxid]" value="[{$oxid}]">

    <table border=0 width="98%">
        <tr>
            <td colspan="2">

                [{if $languages}]
                <FIELDSET id=fldLayout>
                    <LEGEND id=lgdLayout>
                        <select name="editlanguage" id="test_editlanguage" class="saveinnewlanginput" onChange="Javascript:document.myedit.submit();" [{$readonly}]>
                            [{foreach from=$languages key=lang item=olang}]
                            <option value="[{$lang}]"[{if $subjlang == $lang}]SELECTED[{/if}]>[{$olang->name}]</option>
                            [{/foreach}]
                        </select>
                    </LEGEND>
                 [{/if}]

                    <table>
                        <tr>
                            <td class="edittext" >
                                [{oxmultilang ident="CMCONSENTMANAGER_PID"}]
                            </td>
                            <td class="edittext">
                                <input type="text" class="editinput" size="35" maxlength="[{$edit->oxshops__cmconsentmanagerpid->fldmax_length}]" name="editval[oxshops__cmconsentmanagerpid]" value="[{$edit->oxshops__cmconsentmanagerpid->value}]" [{$readonly}]>
                                [{oxinputhelp ident="HELP_CMCONSENTMANAGER_PID"}]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext" >
                                [{oxmultilang ident="CMCONSENTMANAGER_BLOCKING_MODE"}]
                            </td>
                            <td class="edittext">
                                <select name="editval[oxshops__cmconsentmanagerblockingmode]" class="editinput" [{$readonly}]>
                                    <option value="0" [{if $edit->oxshops__cmconsentmanagerblockingmode->value}]SELECTED[{/if}]>[{oxmultilang ident="CMCONSENTMANAGER_BLOCKING_MODE_1"}]</option>
                                    <option value="1" [{if $edit->oxshops__cmconsentmanagerblockingmode->value}]SELECTED[{/if}]>[{oxmultilang ident="CMCONSENTMANAGER_BLOCKING_MODE_2"}]</option>
                                </select>
                                [{oxinputhelp ident="HELP_CMCONSENTMANAGER_BLOCKING_MODE"}]
                            </td>
                        </tr>
                        <tr>
                            <td class="edittext" >
                                [{oxmultilang ident="CMCONSENTMANAGER_CUSTOM_HTML"}]
                            </td>
                            <td class="edittext">
                                <textarea rows="6" cols="60" style="max-width: 500px;vertical-align: middle;" name="editval[oxshops__cmconsentmanagercustomhtml]">[{$edit->oxshops__cmconsentmanagercustomhtml->value}]</textarea>
                                [{oxinputhelp ident="HELP_CMCONSENTMANAGER_CUSTOM_HTML"}]
                            </td>
                        </tr>
                    </table>

                [{if $languages}]
                </FIELDSET>
                [{/if}]
                <br>
            </td>
        </tr>
    </table>

    <br>
    <input type="submit" class="confinput" name="save" value="[{oxmultilang ident="GENERAL_SAVE"}]" onClick="Javascript:document.myedit.fnc.value='save'" [{$readonly}]>
</form>

[{include file="bottomnaviitem.tpl"}]
[{include file="bottomitem.tpl"}]
