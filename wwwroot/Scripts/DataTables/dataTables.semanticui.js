// ***********************************************************************
// Assembly         : Edu
// Author           : Ali Aljarrah && Walid Azouzi
// Created          : 02-23-2020
//
// Last Modified By : Ali Aljarrah && Walid Azouzi
// Last Modified On : 10-15-2019
// ***********************************************************************
// <copyright file="dataTables.semanticui.js" company="Expert Systems">
//     Copyright ©  2019
// </copyright>
// <summary></summary>
// ***********************************************************************
/*! DataTables Bootstrap 3 integration
 * ©2011-2015 SpryMedia Ltd - datatables.net/license
 */

/**
 * DataTables integration for Bootstrap 3. This requires Bootstrap 3 and
 * DataTables 1.10 or newer.
 *
 * This file sets the defaults and adds options to DataTables to style its
 * controls using Bootstrap. See http://datatables.net/manual/styling/bootstrap
 * for further information.
 */
(function( factory ){
	/// <summary>
	/// </summary>
	/// <param name="factory">The factory.</param>
	if ( typeof define === 'function' && define.amd ) {
		// AMD
		define( ['jquery', 'datatables.net'], function ( $ ) {
			/// <summary>
			/// </summary>
			/// <param name="$">The $.</param>
			return factory( $, window, document );
		} );
	}
	else if ( typeof exports === 'object' ) {
		// CommonJS
		module.exports = function (root, $) {
			/// <summary>
			/// </summary>
			/// <param name="root">The root.</param>
			/// <param name="$">The $.</param>
			if ( ! root ) {
				root = window;
			}

			if ( ! $ || ! $.fn.dataTable ) {
				// Require DataTables, which attaches to jQuery, including
				// jQuery if needed and have a $ property so we can access the
				// jQuery object that is used
				$ = require('datatables.net')(root, $).$;
			}

			return factory( $, root, root.document );
		};
	}
	else {
		// Browser
		factory( jQuery, window, document );
	}
}(function( $, window, document, undefined ) {
/// <summary>
/// </summary>
/// <param name="$">The $.</param>
/// <param name="window">The window.</param>
/// <param name="document">The document.</param>
/// <param name="undefined">The undefined.</param>
'use strict';
var DataTable = $.fn.dataTable;


/* Set the defaults for DataTables initialisation */
$.extend( true, DataTable.defaults, {
	dom:
		"<'ui stackable grid'"+
			"<'row'"+
				"<'eight wide column'l>"+
				"<'right aligned eight wide column'f>"+
			">"+
			"<'row dt-table'"+
				"<'sixteen wide column'tr>"+
			">"+
			"<'row'"+
				"<'seven wide column'i>"+
				"<'right aligned nine wide column'p>"+
			">"+
		">",
	renderer: 'semanticUI'
} );


/* Default class modification */
$.extend( DataTable.ext.classes, {
	sWrapper:      "dataTables_wrapper dt-semanticUI",
	sFilter:       "dataTables_filter ui input",
	sProcessing:   "dataTables_processing ui segment",
	sPageButton:   "paginate_button item"
} );


/* Bootstrap paging button renderer */
DataTable.ext.renderer.pageButton.semanticUI = function ( settings, host, idx, buttons, page, pages ) {
	/// <summary>
	/// </summary>
	/// <param name="settings">The settings.</param>
	/// <param name="host">The host.</param>
	/// <param name="idx">The index.</param>
	/// <param name="buttons">The buttons.</param>
	/// <param name="page">The page.</param>
	/// <param name="pages">The pages.</param>
	var api     = new DataTable.Api( settings );
	var classes = settings.oClasses;
	var lang    = settings.oLanguage.oPaginate;
	var aria = settings.oLanguage.oAria.paginate || {};
	var btnDisplay, btnClass, counter=0;

	var attach = function( container, buttons ) {
		/// <summary>
		/// </summary>
		/// <param name="container">The container.</param>
		/// <param name="buttons">The buttons.</param>
		var i, ien, node, button;
		var clickHandler = function ( e ) {
			/// <summary>
			/// </summary>
			/// <param name="e">The e.</param>
			e.preventDefault();
			if ( !$(e.currentTarget).hasClass('disabled') && api.page() != e.data.action ) {
				api.page( e.data.action ).draw( 'page' );
			}
		};

		for ( i=0, ien=buttons.length ; i<ien ; i++ ) {
			button = buttons[i];

			if ( $.isArray( button ) ) {
				attach( container, button );
			}
			else {
				btnDisplay = '';
				btnClass = '';

				switch ( button ) {
					case 'ellipsis':
						btnDisplay = '&#x2026;';
						btnClass = 'disabled';
						break;

					case 'first':
						btnDisplay = lang.sFirst;
						btnClass = button + (page > 0 ?
							'' : ' disabled');
						break;

					case 'previous':
						btnDisplay = lang.sPrevious;
						btnClass = button + (page > 0 ?
							'' : ' disabled');
						break;

					case 'next':
						btnDisplay = lang.sNext;
						btnClass = button + (page < pages-1 ?
							'' : ' disabled');
						break;

					case 'last':
						btnDisplay = lang.sLast;
						btnClass = button + (page < pages-1 ?
							'' : ' disabled');
						break;

					default:
						btnDisplay = button + 1;
						btnClass = page === button ?
							'active' : '';
						break;
				}

				var tag = btnClass.indexOf( 'disabled' ) === -1 ?
					'a' :
					'div';

				if ( btnDisplay ) {
					node = $('<'+tag+'>', {
							'class': classes.sPageButton+' '+btnClass,
							'id': idx === 0 && typeof button === 'string' ?
								settings.sTableId +'_'+ button :
								null,
							'href': '#',
							'aria-controls': settings.sTableId,
							'aria-label': aria[ button ],
							'data-dt-idx': counter,
							'tabindex': settings.iTabIndex
						} )
						.html( btnDisplay )
						.appendTo( container );

					settings.oApi._fnBindAction(
						node, {action: button}, clickHandler
					);

					counter++;
				}
			}
		}
	};

	// IE9 throws an 'unknown error' if document.activeElement is used
	// inside an iframe or frame. 
	var activeEl;

	try {
		// Because this approach is destroying and recreating the paging
		// elements, focus is lost on the select button which is bad for
		// accessibility. So we want to restore focus once the draw has
		// completed
		activeEl = $(host).find(document.activeElement).data('dt-idx');
	}
	catch (e) {}

	attach(
		$(host).empty().html('<div class="ui stackable pagination menu"/>').children(),
		buttons
	);

	if ( activeEl !== undefined ) {
		$(host).find( '[data-dt-idx='+activeEl+']' ).focus();
	}
};


// Javascript enhancements on table initialisation
$(document).on( 'init.dt', function (e, ctx) {
	/// <summary>
	/// </summary>
	/// <param name="e">The e.</param>
	/// <param name="ctx">The CTX.</param>
	if ( e.namespace !== 'dt' ) {
		return;
	}

	// Length menu drop down
	if ( $.fn.dropdown ) {
		var api = new $.fn.dataTable.Api( ctx );

		$( 'div.dataTables_length select', api.table().container() ).dropdown();
	}
} );


return DataTable;
}));