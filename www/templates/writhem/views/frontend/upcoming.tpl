<h2>{$page->title}</h2>

<center>
<div class="btn-group">
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/1">Box Office</a> | 
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/2">In Theatre</a> | 
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/3">Opening</a> | 
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/4">Upcoming</a> | 
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/5">DVD Releases</a>
</div>
</center>
<br />
{$site->adbrowse}	

{if $data|@count > 0}

<table class="data highlight icons table table-bordered table-striped" id="coverstable">
		<tr>
			<th style="width:140px;"></th>
			<th>Name</th>
		</tr>

		{foreach $data as $result}
		<tr class="{cycle values=",alt"}">
			<td class="mid">
				<div class="movcover">
					<center>
					<img class="shadow img img-polaroid" src="{$result->posters->profile}" width="120" border="0" alt="{$result->title|escape:"htmlall"}" />
					<div class="movextra btn-group">
						<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}{$result->links->alternate}" title="View Rotten Tomatoes Details">Rotten</a>
						<a class="btn btn-mini" target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$result->alternate_ids->imdb}" title="View Imdb Details">Imdb</a>				
					</div>
					</center>
				</div>
			</td>
			<td colspan="3" class="left">
				<h4><a href="{$smarty.const.WWW_TOP}/movies?imdb={$result->alternate_ids->imdb}">{$result->title|escape:"htmlall"}</a> (<a class="title" title="{$result->year}" href="{$smarty.const.WWW_TOP}/movies?year={$result->year}">{$result->year}</a>) {if $result->ratings->critics_score > 0}{$result->ratings->critics_score}/100{/if}</h4>
				{if $result->synopsis == ""}No synopsis. Check <a target="_blank" href="{$site->dereferrer_link}{$result->links->alternate}" title="View Rotten Tomatoes Details">Rotten Tomatoes</a> for more information.{else}{$result->synopsis}{/if}
				{if $result->abridged_cast|@count > 0}
					<br /><br />
					<b>Starring:</b> 
					{foreach from=$result->abridged_cast item=cast name=cast}
						<a href="{$smarty.const.WWW_TOP}/movies?actors={$cast->name|escape:"htmlall"}" title="Search for movies starring {$cast->name|escape:"htmlall"}">{$cast->name|escape:"htmlall"}</a>
						{if $smarty.foreach.cast.last}<br/><br/>{else},{/if}						
					{/foreach}
				{else}
					<br/><br/>
				{/if}

				{if $ourmovies[$result->alternate_ids->imdb] != ""}
					<a class="rndbtn btn btn-mini" href="{$smarty.const.WWW_TOP}/movies?imdb={$result->alternate_ids->imdb}">View Movie Downloads</a>
				{else}
					<a {if $userimdbs[$result->alternate_ids->imdb] != ""}style="display:none;"{/if} onclick="mymovie_add('{$result->alternate_ids->imdb}', this);return false;" class="rndbtn btn btn-mini btn-info" href="#">Add To My Movies</a>
				{/if}
				<a style="display:{if $userimdbs[$result->alternate_ids->imdb] != ""}inline{else}none;{/if}" onclick="mymovie_del('{$result->alternate_ids->imdb}', this);return false;" href="#" class="rndbtn btn btn-mini">Remove From My Movies</a>
				<br/>


			</td>
		</tr>
		{/foreach}
</table>

{else}
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Sorry!</strong>
	No results found.
</div>
{/if}
