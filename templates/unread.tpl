<div class="unread">

	<div class="clearfix">
		<!-- IMPORT partials/breadcrumbs.tpl -->

		<div class="btn-toolbar">
			<div class="pull-left">
				<!-- IF loggedIn -->
				<button component="category/post" id="new_topic" class="btn btn-primary">[[category:new_topic_button]]</button>
				<!-- ELSE -->
				<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
				<!-- ENDIF loggedIn -->
			</div>
			<div class="markread btn-group pull-right category-dropdown-container<!-- IF !topics.length --> hidden<!-- ENDIF !topics.length -->">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					[[unread:mark_as_read]] <span class="caret"></span>
				</button>
				<ul class="dropdown-menu category-dropdown-menu" role="menu">

					<li role="presentation">
						<a id="markSelectedRead" role="menuitem" tabindex="-1" href="#">[[unread:selected]]</a>
					</li>

					<li role="presentation">
						<a id="markAllRead" role="menuitem" tabindex="-1" href="#">[[unread:all]]</a>
					</li>
					<li class="divider"></li>
					<!-- BEGIN categories -->
					<li role="presentation" class="category" data-cid="{categories.cid}">
						<a role="menu-item" href="#">{categories.level}<!-- IF categories.icon --><span class="fa-stack"><i style="color: {categories.bgColor};" class="fa fa-circle fa-stack-2x"></i><i class="fa fa-fw fa-stack-1x {categories.icon}" style="color: {categories.color};"></i></span><!-- ENDIF categories.icon --> {categories.name}</a>
					</li>
					<!-- END categories -->
				</ul>
			</div>

			<div component="category/dropdown" class="btn-group pull-right category-dropdown-container">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
					<!-- IF selectedCategory --><!-- IF selectedCategory.icon --><span class="fa-stack"><i style="color: {selectedCategory.bgColor};" class="fa fa-circle fa-stack-2x"></i><i class="fa fa-fw fa-stack-1x {selectedCategory.icon}" style="color: {selectedCategory.color};"></i></span><!-- ENDIF selectedCategory.icon --> {selectedCategory.name}<!-- ELSE -->
					[[unread:all_categories]]<!-- ENDIF selectedCategory --> <span class="caret"></span>
				</button>
				<ul component="category/list" class="dropdown-menu category-dropdown-menu" role="menu">
					<li role="presentation" class="category">
						<a role="menu-item" href="{config.relative_path}/{selectedFilter.url}"><i class="fa fa-fw <!-- IF !selectedCategory -->fa-check<!-- ENDIF !selectedCategory -->"></i> [[unread:all_categories]]</a>
					</li>
					<!-- BEGIN categories -->
					<li role="presentation" class="category" data-cid="{categories.cid}" data-parent-cid="{categories.parentCid}">
						<a role="menu-item" href="{config.relative_path}/{selectedFilter.url}?cid={categories.cid}"><i component="category/select/icon" class="fa fa-fw <!-- IF categories.selected -->fa-check<!-- ENDIF categories.selected -->"></i>{categories.level}<!-- IF categories.icon --><span class="fa-stack"><i style="color: {categories.bgColor};" class="fa fa-circle fa-stack-2x"></i><i class="fa fa-fw fa-stack-1x {categories.icon}" style="color: {categories.color};"></i></span><!-- ENDIF categories.icon --> {categories.name}</a>
					</li>
					<!-- END categories -->
				</ul>
			</div>

			<div class="btn-group pull-right">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				{selectedFilter.name} <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<!-- BEGIN filters -->
					<li role="presentation" class="category">
						<a role="menu-item" href="{config.relative_path}/{filters.url}{querystring}"><i class="fa fa-fw <!-- IF filters.selected -->fa-check<!-- ENDIF filters.selected -->"></i>{filters.name}</a>
					</li>
					<!-- END filters -->
				</ul>
			</div>
		</div>
	</div>

	<hr />

	<div class="category row">
		<div id="category-no-topics" class="alert alert-warning <!-- IF topics.length -->hidden<!-- ENDIF topics.length -->">
			<strong>[[unread:no_unread_topics]]</strong>
		</div>

		<a href="{config.relative_path}/{selectedFilter.url}{querystring}">
			<div class="alert alert-warning hide" id="new-topics-alert"></div>
		</a>
		<div class="col-md-12">
			<!-- IMPORT partials/topics_list.tpl -->
			<button id="load-more-btn" class="btn btn-primary hide">[[unread:load_more]]</button>
			<!-- IF config.usePagination -->
				<!-- IMPORT partials/paginator.tpl -->
			<!-- ENDIF config.usePagination -->
		</div>
	</div>
</div>
