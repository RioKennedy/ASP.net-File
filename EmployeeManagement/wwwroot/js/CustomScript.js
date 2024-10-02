function ConfirmDelete(uniqueId, isTrue)
{
    var deleteSpan = 'deleteSpan_' + uniqueId;
    var confirmDeleteSpan = "confirmDeleteSpan_" + uniqueId;

    if(isTrue)
    {
        jQuery('#' + deleteSpan).hide();
        jQuery('#' + confirmDeleteSpan).show();
    }
    else
    {
        jQuery('#' + deleteSpan).show();
        jQuery('#' + confirmDeleteSpan).hide();
    }
}