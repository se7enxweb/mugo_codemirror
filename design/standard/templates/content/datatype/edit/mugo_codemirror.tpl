{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{ezcss_require( 'codemirror.css' )}

{if is_unset( $attribute_base )}
    {def $attribute_base = 'ContentObjectAttribute'}
{/if}
{if is_unset( $html_class )}
    {def $html_class = 'full'}
{/if}

{def
	$id = concat(
		'ezcoa-',
		$attribute.contentclassattribute_id,
		'_',
		$attribute.contentclass_attribute_identifier
	)
}
<textarea
		id="{$id}"
		class="{eq( $html_class, 'half' )|choose( 'box', 'halfbox' )} ezcc-{$attribute.object.content_class.identifier} ezcca-{$attribute.object.content_class.identifier}_{$attribute.contentclass_attribute_identifier}"
		name="{$attribute_base}_data_text_{$attribute.id}"
		cols="70"
		rows="{$attribute.contentclass_attribute.data_int1}"
>{$attribute.content|wash}</textarea>

<script src="{'javascript/codemirror.js'|ezdesign( 'no' )}"></script>
<script src="{'javascript/mode/javascript/javascript.js'|ezdesign( 'no' )}"></script>
<script src="{'javascript/mode/xml/xml.js'|ezdesign( 'no' )}"></script>
<script src="{'javascript/mode/css/css.js'|ezdesign( 'no' )}"></script>
<script src="{'javascript/mode/htmlmixed/htmlmixed.js'|ezdesign( 'no' )}"></script>

<script>
    {literal}
	(function()
	{
		var mixedMode =
			{
				name: "htmlmixed",
			};
		var editor = CodeMirror.fromTextArea( document.getElementById( "{/literal}{$id}{literal}" ),
			{
				mode: mixedMode,
				selectionPointer: true
			} );
	})();
    {/literal}
</script>