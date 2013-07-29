// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function() {
			$('#jcsdl-edit').jcsdlGui({
				save : function(code) {
					$('#jcsdl-edit-output').val(code);
				},

				// really sloooow animation
                animate : 2000,

                // hide some targets
                hideTargets : ['interaction', 'facebook', 'myspace', 'digg', '2channel', 'video', 'youtube', 'reddit', 'imdb', 'flickr', 'amazon', 'blog', 'board', 'dailymotion', 'newscred', 'topix', 'augmentation',
                	'twitter.domains', 'twitter.in_reply_to_screen_name', 'twitter.links', 'twitter.mentions', 'twitter.source', 'twitter.text', 'twitter.place', 'twitter.retweet', 'twitter.retweeted',
                	'twitter.user.description', 'twitter.user.followers_count', 'twitter.user.follower_ratio', 'twitter.user.friends_count', 'twitter.user.id', 'twitter.user.listed_count', 'twitter.user.location', 'twitter.user.name', 'twitter.user.screen_name', 'twitter.user.statuses_count', 'twitter.user.time_zone', 'twitter.user.url',
            	],
             
             	// change definition of some fields
                definition : {
                	inputs : {
                    	select : {
                     		sets : {
                        		language2 : {'nl': 'Hollands', 'de': 'Deutsch', 'hu': 'Magyar'}
                    		}
                    	}
                   	},
                  	targets : {
                    	twitter : {
                       		fields : {
                         		user : {
                           			fields : {
                             			profile_age : {max : 100, 'default' : 40, step : 1},
                             			lang : {optionsSet: 'language2'}
                        			}
                        		}
                       		}
                     	}
                   	}
                },
                 
                mapsOverlay : {
                  strokeWeight : 1,
                  fillColor : '#FF0000',
                  fillOpacity : 0.3
                }
			});
		});