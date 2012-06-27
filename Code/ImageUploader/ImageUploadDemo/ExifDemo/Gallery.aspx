<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Gallery.aspx.cs"
	Inherits="GpsDemo_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<link rel="stylesheet" type="text/css" href="../../Libraries/fancybox/jquery.fancybox-1.3.1.css" />
	<link href="map.css" rel="stylesheet" type="text/css" />
	<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
	<script src="../../Libraries/fancybox/jquery.fancybox-1.3.1.pack.js" type="text/javascript"></script>
	<script type="text/javascript">
		var uploadedFilesUrl = '<%= HttpUtility.UrlPathEncode(this.ResolveClientUrl(_gallery.UploadedFilesVirtualPath)) %>';
		var thumbnailsUrl = '<%= HttpUtility.UrlPathEncode(this.ResolveClientUrl(_gallery.ThumbnailsVirtualPath)) %>';

		var map, gpsData;

		$(document).ready(function () {

			$('#map_canvas').delegate('.fancybox', 'click', function (ev) {
				var o = $(this);
				if (!o.data('fancybox')) {
					o.data('fancybox', true).fancybox().trigger('click');
				}
				ev.preventDefault();
			});

			//create map
			map = new google.maps.Map($("#map_canvas").get(0), {
				mapTypeId: google.maps.MapTypeId.ROADMAP
			});

			var bounds;

			//create container for popup markups
			$("body").append("<div style=\"display: none;\" id=\"infoContainer\"></div>");

			$.ajax({
				url: '../../UploadedFiles/files.xml',
				cache: false,
				dataType: 'xml',
				success: function (data, textStatus, XMLHttpRequest) {
					$('file', data).each(function (idx, item) {
						item = $(item);

						var lat = item.attr('latitude'),
							lng = item.attr('longitude'),
							name = item.attr('name'),
							sourceUrl = uploadedFilesUrl + '/' + encodeURIComponent(item.attr('source')),
							smallThumbnailUrl = thumbnailsUrl + '/' + encodeURIComponent(item.attr('thumbnail0')),
							largeThumbnailUrl = thumbnailsUrl + '/' + encodeURIComponent(item.attr('thumbnail1')),
							description = item.attr('description') || '',
							size = item.attr('size'),
							dimension = item.attr('dimension');

						// Add item to the list
						var html;
						if (lat && lng)
							html = "<li class=\"item\"><img class=\"preview\" src=\"" + smallThumbnailUrl + "\" alt=\"" + name + "\" /><div class=\"data\"><h3>" +
									name + "</h3><p>Size: " + size + "</p><p>Dimension: " + dimension + "</p></div></li>";
						else
						//add message if there are not GPS data in the photo
							html = "<li class=\"item\"><img class=\"preview\" src=\"" + smallThumbnailUrl + "\" alt=\"" + name + "\" /><div class=\"data\"><h3>" +
									name + "</h3><p><br/><em>No location data.</em></p></div></li>";

						var listItem = $(html).appendTo('.gallery-image-list').bind('click', function () {

							// Close opened popups
							$('.gallery-image-list > li').each(function (idx, item) {
								var popup = $(item).removeClass('selected').data('infoPopup');
								if (popup) {
									popup.close();
								}
							});

							// Select item and show popup
							var marker = $(this).addClass('selected').data('marker');
							if (marker) {
								google.maps.event.trigger(marker, 'click');
							}
						});

						if (lat != null && lng != null) {

							// Add item on the map

							var icon, point, marker, popupHtml = [], el, infoPopup;

							//create popup html
							popupHtml.push("<table><tbody><tr><td style=\"padding: 0pt 5px;\"><img style=\"border: 1px solid rgb(92, 127, 185);\" src=\"");
							popupHtml.push(largeThumbnailUrl);
							popupHtml.push("\" alt=\"");
							popupHtml.push(name);
							popupHtml.push("\"></td><td valign=\"top\"><p style=\"white-space:nowrap\">");
							popupHtml.push("</p></td></tr><tr><td colspan=\"2\"><a class=\"fancybox\" href=\"");
							popupHtml.push(sourceUrl);
							popupHtml.push("\"><font color=\"#3964c2\">View original image (");
							popupHtml.push(size);
							popupHtml.push(")</font></a></td></tr></tbody></table>");
							popupHtml = popupHtml.join('');

							infoPopup = new google.maps.InfoWindow({
								content: popupHtml
							});

							// Origins, anchor positions and coordinates of the marker
							// increase in the X direction to the right and in
							// the Y direction down.
							icon = new google.maps.MarkerImage(smallThumbnailUrl,
								new google.maps.Size(30, 30),
								new google.maps.Point(0, 0),
								new google.maps.Point(15, 15)
							);

							point = new google.maps.LatLng(lat, lng);
							marker = new google.maps.Marker({
								icon: icon,
								map: map,
								position: point,
								title: name
							});

							google.maps.event.addListener(marker, 'click', function (ev) {
								// Close opened popups
								$('.image-list > li').each(function (idx, item) {
									var popup = $(item).removeClass('selected').data('infoPopup');
									if (popup) {
										popup.close();
									}
								});

								infoPopup.open(map, marker);
								listItem.addClass('selected');
							});

							google.maps.event.addListener(infoPopup, 'closeclick', function (ev) {
								listItem.removeClass("selected");
							});

							listItem.data('marker', marker).data('infoPopup', infoPopup);

							// Add point to calculate initial zoom and position
							if (bounds) {
								bounds.extend(point);
							} else {
								bounds = new google.maps.LatLngBounds(point);
							}
						}
					});


					// Set map zoom and position

					if (bounds) {
						map.fitBounds(bounds);
						setTimeout(function () { if (map.getZoom() > 10) map.setZoom(10); }, 500);
					} else {
						map.setOptions({ zoom: 1, center: new google.maps.LatLng(-33.9, 151.2) });
					}
				}
			});
		});

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="Server">
	<div class="gallery">
		<div class="sidebar-gallery">
			<ul class="gallery-image-list">
			</ul>
		</div>
		<div class="map">
			<div id="map_canvas">
			</div>
		</div>
	</div>
</asp:Content>
