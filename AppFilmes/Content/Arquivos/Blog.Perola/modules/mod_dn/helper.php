<?php
###################################################################################################
#  DisplayNews  1.7.0 - Nov -2010 by bkomraz1@gmail.com
#  http://joomla.rjews.net
#  Based on Display News - Latest 1-3 [07 June 2004] by Rey Gigataras [stingrey]   www.stingrey.biz  mambo@stingrey.biz
#  @ Released under GNU/GPL License : http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
###################################################################################################



defined ( '_JEXEC' ) or die ( 'Restricted access' );

// loads module function file
jimport('joomla.event.dispatcher');
require_once (JPATH_SITE . DS . 'components' . DS . 'com_content' . DS . 'helpers' . DS . 'route.php');
require_once (JPATH_LIBRARIES . DS . 'joomla' . DS . 'database' . DS . 'table' . DS . 'category.php');
require_once (JPATH_LIBRARIES . DS . 'joomla' . DS . 'database' . DS . 'table' . DS . 'content.php');

class modDisplayNewsHelper {

	var $version = "DisplayNews by BK 2.0RC4";
	var $css_type = null;
	var $target = "";

	/* function mod_descr_out() 
	{
		$mod_descr_out = "";
		if ($this->params->get('text_module_description')) {
			$mod_descr_out .= "\n \n";
			$class = modDisplayNewsHelper::dn_style("dn-module_description");
			if ($class) {
				$mod_descr_out .= "<span ".$class.">";
			}
			$mod_descr_out .= "\n";
			$mod_descr_out .= $this->params->get('text_module_description');
			if ($class) {
				$mod_descr_out .= "\n </span>";
			}
		}
   
		return $mod_descr_out;
   } */

   /* function mod_title_out( $row )
   {
   $mod_title_out = "";
   // If autotitle set to yes, displays an Auto Title preffix with the name of the section/category
   // $title_text =  "";
   if ( $this->params->get('show_title_auto') ) {

		$title_text = "";
		if ( $this->params->get( 'set_auto_author') && $this->view == "article" ) {
				$title_text = $this->params->get('text_title_auto_pre').implode(', ', $this->params->get( 'set_author_name')).$this->params->get('text_title_auto_suf');
		} elseif ($this->params->get( 'set_auto' )) {
				if ($this->view == "section") {
						$title_text = $this->params->get('text_title_auto_pre').($row->sec_title).$this->params->get('text_title_auto_suf');
				} else if ($this->view == "category" || $this->view == "article" ) {
						$title_text = $this->params->get('text_title_auto_pre').($row->cat_title).$this->params->get('text_title_auto_suf');
				}
		}

	  $mod_title_out = "<".$this->params->get('mod_title_tag','h3').">".$mod_title_out."</".strtok($this->params->get('mod_title_tag','h3'), " ").">";

	  
	  
   }
	return $mod_title_out;
   } */

   function mod_automore_out($row)
	{
	$mod_automore_out = '';
    if ($this->params->get('show_more_auto') ) {
      /* if  ( $this->set_section_id && !is_array($this->set_section_id) && !is_array( $this->set_category_id) )  {
         // $more_section = & JTable::getInstance( 'section' );
         // $more_section->load( $set_section_id_extra );
         $mod_automore_out .= "<span ".modDisplayNewsHelper::dn_style("dn-more").">";
		 $mod_automore_out .= modDisplayNewsHelper::create_link( ContentHelperRoute::getSectionRoute($row->sec_id), 
											$this->params->get('text_more'),
											"dn-more",
											modDisplayNewsHelper::dn_hovertext( $this->params->get('text_hover_more_section'), $row->sec_title ) );
         $mod_automore_out .= "</span>";
      } else */ if ( $this->set_category_id && !is_array($this->set_category_id) /* && !is_array($this->set_section_id) */ ) {
         // $more_category = & JTable::getInstance( 'category' );
         // $more_category->load( $set_category_id_extra );
                 // $catslug = strlen( $row->cat_alias ) ?  $row->catid . ":" . $row->cat_alias : $row->catid;

		 $mod_automore_out .= modDisplayNewsHelper::create_link( modDisplayNewsHelper::fixItemId(ContentHelperRoute::getCategoryRoute($row->catid), $this->params->get('item_id_cat_type'), $this->params->get('item_id_cat')), 
											$this->params->get('text_more'),
											// "dn-more",
											modDisplayNewsHelper::dn_hovertext( $this->params->get('text_hover_more_category'), $row->cat_title ) );
											
		// $class = modDisplayNewsHelper::dn_style("dn-more");
		$mod_automore_out = "<span class=\"readmore\">".$mod_automore_out .= "</span>";
		
      }
   }
   return $mod_automore_out;
   }

   function readmore_out($row, $aroute, $aparams) {
      // Code for displaying of individual items Read More link
      // $show_text && $show_full_text
          $readmore_out =  ""; 
		  // echo "DEBUG: $this->text_limited <br />";
       if ( ($this->params->get('show_readmore') == 1) ||
             (($this->params->get('show_readmore') == 2) && !$this->params->get('show_text') ) ||
             (($this->params->get('show_readmore') == 2) && $this->text_limited ) ||
             (($this->params->get('show_readmore') == 2) && ( $this->params->get('filter_text' , 0 ) < 2 ) && strlen( $row->fulltext ) && !($this->params->get('show_text') > 1 ) )
            ) {
		 
		 	$readmore_out .=  modDisplayNewsHelper::create_link( $aroute, 
											$this->params->get('text_readmore') != "" ? $this->params->get('text_readmore') : ( $aparams->get('readmore') ? $aparams->get('readmore') : JText::_('MOD_DN_READ_MORE_TITLE') ),
											// "dn-read_more",
											modDisplayNewsHelper::dn_hovertext( $this->params->get('text_hover_readmore'), $row->title ) );
			
			
			$readmore_out = "<span class=\"readmore\">".$readmore_out."</span>";
      }
		 return $readmore_out;
	}

 	function import_content_plugins() {
		if ( $this->params->get('on_prepare_content_plugins') || $this->params->get( 'before_display_content_plugins' ) ) {
			if (!$this->params->get('plugins')) {
				static $imported = false;
				if ( !$imported ) {
					JPluginHelper::importPlugin('content');
					$imported =  true;
					// echo "<!-- DEBUG: imported<br> -->";
				}
				
			} else if (!is_array($this->params->get('plugins'))) {
				JPluginHelper::importPlugin('content', $this->params->get('plugins')/*, true, 'core'*/);
			} else {
				foreach ($this->params->get('plugins') as $plg) {
					// echo "DEBUG: $plg<br>";
					JPluginHelper::importPlugin('content', $plg);
				}
			}
		}

	}

	function onPrepareContent(&$row, &$aparams) {
		global $mainframe;

		if ( $this->params->get('on_prepare_content_plugins') ) {
			// $results = $mainframe->triggerEvent('onPrepareContent', array (&$row, &$aparams, 1));
			$dispatcher	=& JDispatcher::getInstance();
			JPluginHelper::importPlugin('content');
			$results = $dispatcher->trigger('onContentPrepare', array ('com_content.article', &$row, &$this->params, 0));
		}
	}

	// Code for displaying of individual items Category
	function cat_out($row) 
	{
	
        $cparams = new JRegistry();
		$cparams->loadJSON($row->cat_params);

        $cat_out =  "";
		if ($this->params->get('show_category_title') ) {

			if ($this->params->get('link_category')) {
				if ($row->cat_published == "1") {
					// $catslug = strlen( $row->cat_alias ) ?  $row->catid . ":" . $row->cat_alias : $row->catid;
					// echo "DEBUG:".ContentHelperRoute::getCategoryRoute($row->catslug)."<br>";
					
					$cat_out .= modDisplayNewsHelper::create_link( modDisplayNewsHelper::fixItemId(ContentHelperRoute::getCategoryRoute($row->catid), $this->params->get('item_id_cat_type'), $this->params->get('item_id_cat')), 
												$row->cat_title,
												// "dn-category",
												modDisplayNewsHelper::dn_hovertext( $this->params->get('text_hover_category'), $row->cat_title ) );
				   
				} else {
				   $cat_out .= $row->cat_title;
				}
			} else {
				$cat_out .= $row->cat_title;
			}
			
			// $class = modDisplayNewsHelper::dn_style("dn-category");
			
			$cat_out = "<span class=\"category-name\">".$cat_out.= "</span>";

			if ( ($this->params->get('show_description_image') && $cparams->get('image')) || 
				 ($this->params->get('show_description') && $row->cat_description) ) {
				$cat_out .= "<div class=\"category-desc\">";
				if ($this->params->get('show_description_image') && $cparams->get('image')) {
					$cat_out .= "<img src=\"".$cparams->get('image')."\"/>";
				}
				if ($this->params->get('show_description') && $row->cat_description) {
					$cat_out .= JHtml::_('content.prepare', $row->cat_description);
				}
				$cat_out .= "</div>";
			}
			
		}  //---------------------------------------------------------------------
		return $cat_out;
		
	}

/* 	function sec_out($row) {
          $sec_out =  "";
      if ( $this->params->get('show_section') ) {
         // $sec_out .= "\n\t\t";
         $sec_out .=  "<span ".modDisplayNewsHelper::dn_style("dn-section").">";
         if ($this->params->get('link_section') ) {
            if ($row->sec_published == "1") {
				
			   	$sec_out .= modDisplayNewsHelper::create_link( ContentHelperRoute::getSectionRoute($row->sec_id), 
											$row->sec_title,
											"dn-section",
											modDisplayNewsHelper::dn_hovertext( $this->params->get('text_hover_section'), $row->sec_title ) );
            } else {
               $sec_out .=  $row->sec_title;
            }
         } else {
            $sec_out .=  $row->sec_title;
         }
         $sec_out .=  "</span>";
      }
	  return $sec_out;
  }
 */
	  function text_out($row, $aroute) {
	
          $text_out =  "";
          $img_out = "";


		  $text="";


      // Code for displaying of individual items Intro Text
      if ($this->params->get('show_text') ) {

       // perform the replacement
                // $row->text = str_replace( $regex, '', $row->text );

                // Removes instances of {mospagebreak} from being displayed
        $row->text = str_replace( '{mospagebreak}', '', $row->text );
        $text = $row->text;
		
		if ( $this->params->get('image') && 
			 $this->params->get( "image_default", 0 ) &&
			 $this->params->get( "image_default_file", "" ) && 
			 strpos($text, '<img') === false ) {
			$text = '<img src="'.$this->params->get( "image_default_file" ).'">'.$text;
		}

                if (!$this->params->get('image')) {
                        $text = preg_replace( '/<img[^>]*>/i', '', $text );
                }

                if ($this->params->get('image') && $this->params->get('image_scale') && !( !$this->params->get('image_width')  && !$this->params->get('image_height') ) ) {
                                $text = preg_replace( '/(<img[^>]*)(\s+width\s*=\s*["\']?\w+["\']?)([^>]*>)/i', '$1 $3', $text );
                                $text = preg_replace( '/(<img[^>]*)(\s+height\s*=\s*["\']?\w+["\?]?)([^>]*>)/i', '$1 $3', $text );
                                $text = preg_replace( '/(<img[^>]*\s+style\s*=\s*".*)(\s?width\s*:\s*\w+\s*[;]?)([^>]*>)/i', '$1 $3', $text );
                                $text = preg_replace( '/(<img[^>]*\s+style\s*=\s*".*)(\s?height\s*:\s*\w+\s*[;]?)([^>]*>)/i', '$1 $3', $text );

                                /* if ( $image_scale == 1 ) {
                                        $text = preg_replace( '/(<img[^>]*)(>)/i', '$1 '. "width=".$image_width .' $2', $text );
                                } else if ( $image_scale == 2 ) {
                                        $text = preg_replace( '/(<img[^>]*)(>)/i', '$1 '. "height=".$image_height ' $2', $text );
                                } else if ( $image_scale == 3 ) { */
                                        /* $text = preg_replace_callback( '@(<img[^>]*\s+src\s*=\s*)(["\']*)([^"\']+)(["\']*)([^>]*>)@i',
                                                                create_function(
                                                                        // single quotes are essential here,
                                                                        // or alternative escape all $ as \$
                                                                        '$img',
                                                'return $img[1].$img[2].$img[3].$img[4]." ".modDisplayNewsHelper::imageResize($img[3],'.$image_width.','.$image_height.')." ".$img[5];'
                                                                ),
                                                                $text
                                                        ); */
														
														
										$text = preg_replace_callback( '@(<img[^>]*\s+)(src\s*=\s*["\']*)([^"\']+)(["\']*)([^>]*>)@i',
                                                                create_function(
                                                                        // single quotes are essential here,
                                                                        // or alternative escape all $ as \$
                                                                        '$img',
 'return $img[1]." ".modDisplayNewsHelper::imageResize($img[3],'.$this->params->get('image_width').','.$this->params->get('image_height').',"'.$this->params->get('image_scale').'","'.$this->params->get('image_bg', "#FFFFFF").'","'.$this->params->get('image_type').'")." ".$img[5];'
                                                                ),
                                                                $text
                                                        );

                                // }
                }



                if ($this->params->get('image') && $this->params->get('image_align')) {
                        $text = preg_replace( '/(<img[^>]*)(\s+align\s*=\s*["\']?\w+["\']?)([^>]*>)/i', '$1 $3', $text );
                        $text = preg_replace( '/(<img[^>]*\s+style\s*=\s*".*)(\s?float\s*:\s*\w+\s*[;]?)([^>]*>)/i', '$1 $3', $text );
                        $text = preg_replace( '/(<img[^>]*\s+style\s*=\s*".*)(\s?align\s*:\s*\w+\s*[;]?)([^>]*>)/i', '$1 $3', $text );

                        switch ($this->params->get('image_align')) {
							case 2: $align="left"; break;
							case 3: $align="right"; break;
							case 4: $align="middle"; break;
							case 5: $align="top"; break;
							case 6: $align="bottom"; break;
                            case 7: $align = $r%2 ? "left"  : "right"; break;
                            case 8: $align = $r%2 ? "right" : "left "; break;
                        }
						

                        if ( $this->params->get('image_align') >= 2) {
								$text = preg_replace( '@(<img\s+[^>]*)(/>)|(<img\s+[^>]*)(>)@i', '$1$3 align="'.$align.'" $2$4', $text );

                        }
						// echo "DEBUG: $align ".htmlspecialchars($text)."<br>";
						
						
                }

                if ($this->params->get('image') && $this->params->get('image_margin')<>"") {
					$text = preg_replace( '/(<img[^>]*)(\s+hspace\s*=\s*["\']?\w+["\']?)([^>]*>)/i', '$1 $3', $text );

					$text = preg_replace( '/(<img[^>]* style\s*=\s*(["\'])[^\\2>]*)margin[^;\\2>]*[;]([^\\2>]*\\2[^>]*>)/i', '$1  $3', $text );
					$text = preg_replace( '/(<img[^>]* style\s*=\s*(["\'])[^\\2>]*)margin[^;\\2>]*[;]([^\\2>]*\\2[^>]*>)/i', '$1  $3', $text );
					$text = preg_replace( '/(<img[^>]* style\s*=\s*(["\'])[^\\2>]*)margin-left[^;\\2>]*[;]([^\\2>]*\\2[^>]*>)/i', '$1  $3', $text );
					$text = preg_replace( '/(<img[^>]* style\s*=\s*(["\'])[^\\2>]*)margin-top[^;\\2>]*[;]([^\\2>]*\\2[^>]*>)/i', '$1  $3', $text );
					$text = preg_replace( '/(<img[^>]* style\s*=\s*(["\'])[^\\2>]*)margin-right[^;\\2>]*[;]([^\\2>]*\\2[^>]*>)/i', '$1  $3', $text );					
					$text = preg_replace( '/(<img[^>]* style\s*=\s*(["\'])[^\\2>]*)margin-bottom[^;\\2>]*[;]([^\\2>]*\\2[^>]*>)/i', '$1  $3', $text );
					
					// $text = preg_replace( '/(<img[^>]*\s+)((style\s*=\s*")([^"]*)(["]))+(.*[^>]*>)/i', '$1  $3 $4 $5 ', $text );

					
					$text = preg_replace( '/((<img[^>]*)( style\s*=\s*(["\']))([^\\4>]*)\\4([^>]*>))|((<img\s*)([^>]*>))/i', '$2$8 style=" margin: '.$this->params->get('image_margin').'; $5" $6$9', $text ); 
					
					
					
					/* $text = preg_replace( '/(<img[^>]*\s+)((style\s*=\s*["])([^"]*)(["]))([^>]*>)/', 
						'$1 style="margin: '.$this->params->get('image_margin').'; $4 " $6', $text );
					
					$text = preg_replace( '/(<img[^>]*\s+)((style\s*=\s*["])([^"]*)(["]))?([^>]*>)/', 
						'$1 style="margin: '.$this->params->get('image_margin').'; $4 " $6', $text ); */
					
						// '$1 AAA="margin:'.$image_margin.'; $4" $6', $text );
					// $text = preg_replace( '/(<img\s+[^>]*)(>)/i', '${1} ; ${2}', $text );
                }
				
				
				if ( $this->params->get('image') && $this->params->get( "image_class" ) ) {
					switch ($this->params->get( "image_class" )) {
					case 1: // Remove
						$text = preg_replace( '/(<img[^>]*\s*)(class\s*=\s*(["\'])[^"\']*\3)([^>]*>)/i', 
									'$1 $4', $text );
						break;
					case 2: // Replace
						$text = preg_replace( '@((<img[^>]*\s*)(class\s*=\s*(["\'])([^"\']*)\4)([^>]*>))|((<img\s*)([^>]*>))@i',  
									'$2$8 class="'.$this->params->get( "image_class_name" ).'" $6$9', $text );
						break;
					case 3: // Add
						$text = preg_replace( '@((<img[^>]*)(class\s*=\s*(["\'])([^"\']*)\4)([^>]*[/]?>))|((<img\s*)([^>]*>))@i',  
									'$2$8 class="$5'.$this->params->get( "image_class_name" ).'" $6$9', $text );
						break;
						
					}
				}

                if ($this->params->get('image_num')) {
                        global $i;
                        $i = 0;

                        $text = preg_replace_callback( '/<img[^>]*>/i',
                                                create_function(
                                                        // single quotes are essential here,
                                                        // or alternative escape all $ as \$
                                                        '$img',
                                                        'global $i; $i ++; if ($i <= '.$this->params->get('image_num').') return $img[0];'
                                                ),
                                                $text
                                        );
                }

// $title_out .= "<a href='".JRoute::_(ContentHelperRoute::getArticleRoute($row->slug, $row->catslug, $row->sectionid ))."' >".$title."</a>";

                if ( $this->params->get('image') > 1 ) {
                        preg_match_all('/(<img[^>]*>)/i',$text, $out);
                        $i = 0;
                        foreach ($out[0] as $val) {
						
                                if ($this->params->get('link_image')) {
                                        // $img_out .= "<a ".$this->target." href=".$aroute." >";
									$val = preg_replace('#title=(["\'])(.*?)\\1#i', '', $val);
									$img_out .= modDisplayNewsHelper::create_link( $aroute, 
											$val );
                                } else {
									$img_out .= $val;
								}
                                // if ($link_image) {
                                //         $img_out .= "</a>";
                                // }
                                $i++;
                                if ( $this->params->get('image_num') ) {
                                        if ( $i >= $this->params->get('image_num')-1 ) {
                                                break;
                                        }
                                }
                        }

                        $text = preg_replace( '/<img[^>]*>/i', '', $text );
                }


                //$link1 = "<a href=".$aroute." >";
                //$link2 = "</a>";

                // $text ="";
                //foreach ($out["txt"] as $val) {
                //      $text .= $val;
                //}
                if ( $this->params->get('image') && $this->params->get('link_image') && !$this->params->get('link_text') ) {

                        $text = preg_replace_callback( '/(<a href[^>]*><img[^>]*><\/a[^>]*>)|(<img[^>]*)(title=(["\']).*?\\3)([^>]*>)/i',
                                                create_function(
                                                        // single quotes are essential here,
                                                        // or alternative escape all $ as \$
                                                        '$img',
                                                        'return $img[1].$img[2].$img[5];'
                                                ),
                                                $text
                                        );
										
                        $text = preg_replace_callback( '/(<a href[^>]*><img[^>]*><\/a[^>]*>)|(<img[^>]*>)/i',
                                                create_function(
                                                        // single quotes are essential here,
                                                        // or alternative escape all $ as \$
                                                        '$img',
                                                        "return \"<a ".$this->target." href=$aroute>\".\$img[1].\$img[2].\"</a>\";"
                                                ),
                                                $text
                                        );
										
										
										

                }

        $text = JFilterOutput::ampReplace($text);
        $this->text_limited = 0;
        if ($this->params->get('filter_text' , 0 ) ) {
            $text = modDisplayNewsHelper::dn_filter( $text );
		}
		
        if ( $this->params->get( 'limit_text') ) {
                $this->text_limited = modDisplayNewsHelper::dn_limit( $text, 
					$this->params->get( 'limit_text'), 
					$this->params->get('length_limit_text', 30), 
					$this->params->get('truncate_ending', 1) ? $this->params->get('truncate_ending_sign', '...') : '' );
        }
		// echo "DEBUG: $this->text_limited <br>";

         //  HTML for outputing of Intro Text

         if ($this->params->get('link_text') ) {
			/* $text_out .= modDisplayNewsHelper::create_link( $aroute,
											preg_replace('/(<a\w+href\w*=[^>]*>)|(<\w*\/a\w*>)/i', "", $text ),
											"dn-introtext-link",
				// modDisplayNewsHelper::dn_hovertext( $this->params->get('text_hover_readmore'), $row->title ) 
											modDisplayNewsHelper::dn_hovertext( "", 
																				preg_replace('/(<a\w+href\w*=[^>]*>)|(<\w*\/a\w*>)/i', 
																							 "", 
																							 modDisplayNewsHelper::dn_filter( $text ) ) ) );*/
																							 
																					
			$text_out .= modDisplayNewsHelper::create_link( $aroute, 
												preg_replace('/(<a\w+href\w*=[^>]*>)|(<\w*\/a\w*>)/i', "", $text ),
												// "dn-introtext-link",
												htmlspecialchars(modDisplayNewsHelper::dn_hovertext( $this->params->get('text_hover_text'), 
															preg_replace('/(<a\w+href\w*=[^>]*>)|(<\w*\/a\w*>)|(<img[^>]*>)/i', 
															"", 
															modDisplayNewsHelper::dn_filter( $row->text ) ) )) );
												
         } else {
                $text_out .= $text;
         }
		 /* $class = modDisplayNewsHelper::dn_style("dn-introtext");
		 if ( $class ) {
			$text_out = "<span ".$class.">".$text_out."</span>";
		} */
      }
	  
	  return array($text_out, $img_out);
  }

	  function before_out(&$row, $aparams) {
		  $before_out = "";
			if ( $this->params->get( 'before_display_content_plugins' ) ) {
				$aparams->set('show_vote', $this->params->get( 'show_vote' ) && !$this->params->get( 'force_builtin_rating') );
				
				$dispatcher	=& JDispatcher::getInstance();
				// JPluginHelper::importPlugin('content', 'image');
				$results = $dispatcher->trigger('onContentBeforeDisplay', array ('com_content.article', &$row, &  $this->params, 0));
				// $results = $mainframe->triggerEvent('onBeforeDisplayContent', array (&$row, &$aparams, 1));
				$results = trim(implode("\n", $results));
				// echo print_r($results, true);
				// $text_out = $results."<div style=\"clear: both;\"></div>".$text_out;
				$before_out = $results;
			}
			   return $before_out;

		}

		function rate_out($row) {
          $rate_out =  "";
		if ($this->params->get('show_vote') ) {
			// These attributes need to be defined in order for the voting plugin to work
			if ( !isset($row->rating_count) ) {
				$row->rating_count	= 0;
				$row->rating		= 0;
			}
			
			if ( $this->params->get( 'force_builtin_rating') || !$this->params->get( 'before_display_content_plugins' ) ) {
                // look for images in template if available
                $img = '';
				
				// look for images in template if available
				$starImageOn = JHTML::_('image','system/rating_star.png', NULL, NULL, true);
				$starImageOff = JHTML::_('image','system/rating_star_blank.png', NULL, NULL, true);

                for ($i=0; $i < $row->rating; $i++) {
                        $img .= $starImageOn;
                }
                for ($i=$row->rating; $i < 5; $i++) {
                        $img .= $starImageOff;
                }

                if ( $this->params->get('rating_txt') ) {
					$rate_out .= JText::_( $this->params->get( 'rating_txt' ) );
				} else {
					$rate_out .= JText::_( 'MOD_DN_USER_RATING' ) .':';
				}
				$rate_out .= $img .'&nbsp;/&nbsp;';
                $rate_out .= intval( $row->rating_count );
				
				$rate_out = '<span class="content_rating">'.$rate_out."</span>";
			}
		}
		return $rate_out;
	}
	
	function hits_out($row) {
          $hits_out =  "";
	  if ($this->params->get('show_hits') ) {

		// $class = modDisplayNewsHelper::dn_style("dn-hits");
		$hits_out .= $row->hits;
		
		$hits_out = "<span class=\"hits\">".$hits_out."</span>";
	  }
	     return $hits_out;

	}
	
	function jcomments_out($row) {
          $jcomments_out =  "";
	  if ($this->params->get('jcomments') && $this->params->get('show_jcomment_counter') ) {

		// $class = modDisplayNewsHelper::dn_style("dn-hits");
		// if ( $class ) {
			// $jcomments_out .= "<span ".$class.">";
		// }
		$jcomments_out .= $row->jcounter;
		// if ( $class ) {
			$jcomments_out = "<span class=\"hits\">".$jcomments_out."</span>";
		// }
	  }
	     return $jcomments_out;

	}


	function author_out($row, $aparams)
	{
          $author_out =  "";
	  // Code for displaying of individual items Author
	  if ( $this->params->get('show_author') && ( ($this->params->get('show_author') == 1)  || ($aparams->get('show_author', $this->globalConfig->get('show_author'))) ) )  {
		 $author_out .= $row->author;
		// $class = modDisplayNewsHelper::dn_style("dn-author");
			$author_out = "<span class=\"createdby\">".$author_out."</span>";
	  }
   return $author_out;

	  }

      // Code for displaying of individual items Date
	  function date_out($row, $aparams) {
          $date_out =  "";
      //To show date item created, date mambot called
          $create_date = null;
		  if ( ($this->params->get('show_date') ) && (intval( $row->created ) <> NULL) ) {
			 $create_date = JHTML::_('date', $row->created, $this->params->get('format_date', JText::_('DATE_FORMAT_LC1')) );
		  }

		if ( $create_date <> null && $this->params->get('show_date') && ( ($this->params->get('show_date') == 1)  || ($aparams->get('show_date', $this->globalConfig->get('show_date'))) ) )  {
			$date_out .= $create_date;
			 
			// $class = modDisplayNewsHelper::dn_style("dn-date");
			// if ( $class ) {
				$date_out = "<span class=\"create\">".$date_out."</span>";
			// }
		}
		return $date_out;
	  }
	  
		
      // Code for displaying of individual items Title
      //---------------------------------------------------------------------

	  function title_out($row, $aroute) {
          $title_out =  "";
		  if ($this->params->get('show_title') ) {
			 $title = $row->title;
			 $title = JFilterOutput::ampReplace( $title );
			 if ($this->params->get('filter_title') ) {
				$title = modDisplayNewsHelper::dn_filter( $title );
				modDisplayNewsHelper::dn_limit( $title, $this->params->get('filter_title'), $this->params->get('length_limit_title' ),
					$this->params->get('truncate_ending_title', 1) ? $this->params->get('truncate_ending_title_sign', '...') : '' );
			 }

			 //  HTML for outputing of Title
			 // $class = modDisplayNewsHelper::dn_style("dn-head");
			 
			 if ($this->params->get('link_titles') ) {
				
				$title_out .= modDisplayNewsHelper::create_link( $aroute, 
												$title,
												// "dn-title",
												modDisplayNewsHelper::dn_hovertext( $this->params->get('text_hover_title'), $row->title ) );
				
			 } else {
				$title_out .= $title;
			 }
			 
			$title_out = "<".$this->params->get('title_tag','span class="title"').">".$title_out."</".strtok($this->params->get('title_tag','span'), " ").">";
			 
		  }
		  return $title_out;
	  }
	
	
	function create_link( $url, $text, /* $style = "", */$tooltip ="" ) {
	
	
		// echo "DEBUG:$tooltip<br>";
		
		// ".$this->target." 
		if ( !$this->params->get('link_type', 0) ) {
			$href = "<a href=\"";
		} else {
			$href = "<a href=\"javascript: void(0)\" onclick=\"window.open( '";
		}

		// $href .= JRoute::_(modDisplayNewsHelper::fixItemId($url));
		$href .= JRoute::_($url);
	

		if ( !$this->params->get('link_type') ) {
			$href .= "\" ";
		} else {
			$href .= "', '".$this->params->get("link_target")."', '";
			if ( $this->params->get("window_height") ) {
				$href .= "height=".$this->params->get("window_height").",";
			}
			if ( $this->params->get("window_width") ) {
				$href .= "width=".$this->params->get("window_width").",";
			}
			$href .= "menubar=".$this->params->get("window_menubar", 0).",";
			$href .= "directories=".$this->params->get("window_directories", 0).",";
			$href .= "location=".$this->params->get("window_location", 0).",";
			$href .= "resizable=".$this->params->get("window_resizable", 0).",";
			$href .= "scrollbars=".$this->params->get("window_scrollbars", 0).",";
			$href .= "status=".$this->params->get("window_status", 0).",";
			$href .= "toolbar=".$this->params->get("window_toolbar", 0).",";
			$href .= "'); return false;\"";
		}
			
		// $href .= ($style ? modDisplayNewsHelper::dn_style($style) : "" )." ";
		if ( $this->params->get('show_tooltips') && $tooltip ) {
				 $href .= "title=\"".htmlspecialchars($tooltip)."\"";
		}
		$href .= ">".$text."</a>"; 
			
		return $href;
		
		
		
	/*	<a href="javascript: void(0)" 
   onclick="window.open('popup.html', 
  'windowname1', 
  'width=200, height=77'); 
   return false;">Click here for simple popup window</a>
   */
	}
	
	function fixItemId( $url, $item_id_type, $item_id) {
		if ( $item_id_type == 2 ||
			($item_id_type == 1 && !preg_match('/&Itemid=[0-9]*/i', $url )) ) {
		
			
			if ( $item_id == -1 ) {
				$item_id = JRequest::getInt('Itemid');
			}
			$url = preg_replace('/&Itemid=[0-9]*/i', '', $url).'&Itemid='.$item_id;
		}
		return JRoute::_($url);
	}
	


	
   // Function to filter html code and special characters from text
   function dn_filter( $text ) {
		$text = preg_replace('@<div[^>]*class=(["\'])mosimage_caption\\1[^>]*>[^>]*</div>@', '', $text );
		
		/**
		 * Remove HTML tags, including invisible text such as style and
		 * script code, and embedded objects.  Add line breaks around
		 * block-level tags to prevent word joining after tag removal.
		 
		 http://nadeausoftware.com/articles/2007/09/php_tip_how_strip_html_tags_web_page
		 
		 */		
		$text = preg_replace(
			array(
			  // Remove invisible content
				'@<head[^>]*?>.*?</head>@siu',
				'@<style[^>]*?>.*?</style>@siu',
				'@<script[^>]*?.*?</script>@siu',
				'@<object[^>]*?.*?</object>@siu',
				'@<embed[^>]*?.*?</embed>@siu',
				'@<applet[^>]*?.*?</applet>@siu',
				'@<noframes[^>]*?.*?</noframes>@siu',
				'@<noscript[^>]*?.*?</noscript>@siu',
				'@<noembed[^>]*?.*?</noembed>@siu',
			  // Add line breaks before and after blocks
				'@</?((address)|(blockquote)|(center)|(del))@iu',
				'@</?((div)|(h[1-9])|(ins)|(isindex)|(p)|(pre))@iu',
				'@</?((dir)|(dl)|(dt)|(dd)|(li)|(menu)|(ol)|(ul))@iu',
				'@</?((table)|(th)|(td)|(caption))@iu',
				'@</?((form)|(button)|(fieldset)|(legend)|(input))@iu',
				'@</?((label)|(select)|(optgroup)|(option)|(textarea))@iu',
				'@</?((frameset)|(frame)|(iframe))@iu',
			),
			array(
				' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ',
				"\n\$0", "\n\$0", "\n\$0", "\n\$0", "\n\$0", "\n\$0",
				"\n\$0", "\n\$0",
			),
			$text );		
		$preserv = "<img>";
		$preserv .= $this->params->get("preserve_tags");
		$text = strip_tags($text, /* exclude */ $preserv );
		//      $text = preg_replace("'<script[^>]*>.*?</script>'si","",$text);
		/* $text = preg_replace("@<script[^>]*?>.*?</script>@si","",$text); */
		$text = preg_replace('/{.+?}/','',$text);
		// $text = preg_replace('/&amp;/',' ',$text);
		$text = preg_replace('/&quot;/',' ',$text);
		// $text = htmlspecialchars($text);
		$text = str_replace(array("\r\n", "\n", "\r"), " ", $text);
		$text = preg_replace('/(( )|(&nbsp;))+/',' ',$text);
		$text = trim($text);
      return $text;
   }

   //  Function required to create set of Names, '' added
   function dn_set_name( $param ) {
          if ($param <> "") {
         $paramA = explode(",", $param);
         $a = "0";
         foreach ($paramA as $paramB) {
            $paramB = trim($paramB);
            $paramB = "'".addslashes($paramB)."'";
            $paramA[$a] = $paramB;
            $a++;
         }
         $param= implode(",", $paramA);
      }
          return $param;
   }
   //---------------------------------------------------------------------
   //  Functinality to allow text_hover to be blank by use if special character "#" entered
   //  If not then space added to the end of the variables
   function dn_hovertext( $text1, $text2 ) {
		if ($text1 == "#") {
			return "";
		}
		return $text1." ".$text2;
   }
   //---------------------------------------------------------------------


   /**
   http://www.gsdesign.ro/blog/cut-html-string-without-breaking-the-tags/
 * Truncates text.
 *
 * Cuts a string to the length of $length and replaces the last characters
 * with the ending if the text is longer than length.
 *
 * @param string  $text String to truncate.
 * @param integer $length Length of returned string, including ellipsis.
 * @param string  $ending Ending to be appended to the trimmed string.
 * @param boolean $exact If false, $text will not be cut mid-word
 * @param boolean $considerHtml If true, HTML tags would be handled correctly
 * @return string Trimmed string.
 */
	function truncate($text, $length = 100, $ending = '...', $exact = true, $considerHtml = false) {
	
		require_once(JPATH_LIBRARIES.DS.'phputf8'.DS.'utf8.php');
	
		if (utf8_strlen($ending)>$length) {
			$ending = utf8_substr($ending, 0, $length);
		}
		
		if ($considerHtml) {
		
			// if the plain text is shorter than the maximum length, return the whole text
			if (utf8_strlen(preg_replace('/<.*?>/', '', $text)) <= $length) {
				return array(false,$text);
			}
			// splits all html-tags to scanable lines
			preg_match_all('/(<.+?>)?([^<>]*)/s', $text, $lines, PREG_SET_ORDER);
			$total_length = utf8_strlen($ending);
			$open_tags = array();
			$truncate = '';
			foreach ($lines as $line_matchings) {
				// if there is any html-tag in this line, handle it and add it (uncounted) to the output
				if (!empty($line_matchings[1])) {
					// if it's an "empty element" with or without xhtml-conform closing slash (f.e. <br/>)
					if (preg_match('/^<(\s*.+?\/\s*|\s*(img|br|input|hr|area|base|basefont|col|frame|isindex|link|meta|param)(\s.+?)?)>$/is', $line_matchings[1])) {
						// do nothing
					// if tag is a closing tag (f.e. </b>)
					} else if (preg_match('/^<\s*\/([^\s]+?)\s*>$/s', $line_matchings[1], $tag_matchings)) {
						// delete tag from $open_tags list
						$pos = array_search($tag_matchings[1], $open_tags);
						if ($pos !== false) {
							unset($open_tags[$pos]);
						}
					// if tag is an opening tag (f.e. <b>)
					} else if (preg_match('/^<\s*([^\s>!]+).*?>$/s', $line_matchings[1], $tag_matchings)) {
						// add tag to the beginning of $open_tags list
						array_unshift($open_tags, strtolower($tag_matchings[1]));
					}
					// add html-tag to $truncate'd text
					$truncate .= $line_matchings[1];
				}
				// calculate the length of the plain text part of the line; handle entities as one character
				$content_length = utf8_strlen(preg_replace('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|[0-9a-f]{1,6};/i', ' ', $line_matchings[2]));
				if ($total_length+$content_length > $length) {
					// the number of characters which are left
					$left = $length - $total_length;
					$entities_length = 0;
					// search for html entities
					if (preg_match_all('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|[0-9a-f]{1,6};/i', $line_matchings[2], $entities, PREG_OFFSET_CAPTURE)) {
						// calculate the real length of all entities in the legal range
						foreach ($entities[0] as $entity) {
							
							if ($entity[1]+1-$entities_length <= $left) {
								$left--;
								$entities_length += utf8_strlen($entity[0]);
							} else {
								// no more characters left
								break;
							}
						}
					}
					$truncate .= utf8_substr($line_matchings[2], 0, $left+$entities_length);
					// maximum lenght is reached, so get off the loop
					break;
				} else {
					$truncate .= $line_matchings[2];
					$total_length += $content_length;
				}
				// if the maximum length is reached, get off the loop
				if($total_length>= $length) {
					break;
				}
			}
		} else {
			if (utf8_strlen($text) <= $length) {
				return array(true,$text);
			} else {
				$truncate = utf8_substr($text, 0, $length - utf8_strlen($ending));
			}
		}
		// if the words shouldn't be cut in the middle...
		if (!$exact) {
			// ...search the last occurance of a space...
			$spacepos = utf8_strrpos($truncate, ' ');
			if (isset($spacepos)) {
				// ...and cut the text in this position
				$truncate = utf8_substr($truncate, 0, $spacepos);
			}
		}
		// add the defined ending to the text
		$truncate .= $ending;
		if($considerHtml) {
			// close all unclosed html-tags
			foreach ($open_tags as $tag) {
				$truncate .= '</' . $tag . '>';
			}
		}
		return array(true,$truncate);
	}


   // Function that limits title, intro or full to specified character or word length
    function dn_limit( &$text, $limit_type, $length_chars, $ending = '...') {

		if ($length_chars == 0 ) {
			$text = "";
			$limited = true;
		} else {
			$text = str_replace(array("\r\n", "\n", "\r"), " ", $text);
			list($limited, $text) = modDisplayNewsHelper::truncate($text, $length_chars, $ending, /* $exact = */ $limit_type == 1, /* $considerHtml */ true );
		}
		// echo "DEBUG: rc=$rc<br>";
		return $limited;
		
	
    }


	//---------------------------------------------------------------------








function imageResize($originalImage,$toWidth,$toHeight,$image_scale, $bgcolor, $image_type){

	static $multithumb_loaded = 0;

	if (substr($originalImage, 0, 1) == "/") {
		
		$originalImage = substr_replace( $originalImage, "", 0, strlen(JURI::base( true ))+1 );
	}
	// echo "DEBUG: $originalImage <br>";

	if ( $image_scale != "scale" && !$multithumb_loaded ) {
		if ( file_exists  ( JPATH_SITE . DS . 'plugins' . DS . 'content' . DS . 'multithumb' . DS . 'multithumb.php' ) ) {
			require_once (JPATH_SITE . DS . 'plugins' . DS . 'content' . DS . 'multithumb' . DS . 'multithumb.php');
			$multithumb_loaded = 1;
		} else {
			$multithumb_loaded = -1;
		}
		
	}

	if ( $image_scale != "scale" && $multithumb_loaded == 1 ) {
	
	
		$imgtemp = plgContentMultithumb::botmt_thumbnail("$originalImage", $toWidth, $toHeight, $image_scale, hexdec($bgcolor) , /* $watermark = */ 0, /* $dest_folder = */ 'thumbs', /* $size_only =  */ 0, /* $size = */ 0, $image_type );
								
		if($imgtemp) {
			return "src=\"${imgtemp}\"  width=\"$toWidth\" height=\"$toHeight\" ";
		} else {
			return modDisplayNewsHelper::imageResizeScale($originalImage, $toWidth, $toHeight);
		}
	} else {
		return modDisplayNewsHelper::imageResizeScale($originalImage, $toWidth, $toHeight);
	}
}

function imageResizeScale($originalImage,$toWidth,$toHeight){

    // Get the original geometry and calculate scales
    $size = @getimagesize($originalImage);
    if ( !$size || ( !$toWidth && !$toHeight ) ) {
        return "src=\"${originalImage}\" width=\"$toWidth\" height=\"$toHeight\" ";
    }
    list($width, $height) = $size;

	if ( ( $toWidth && $width <= $toWidth ) && ( $toHeight && $height <= $toHeight) ) {
			return "src=\"${originalImage}\" width=\"$width\" height=\"$height\" ";
	}

	if ($toWidth) {
		$xscale=$width/$toWidth;
	}
	
	if ($toHeight) {
		$yscale=$height/$toHeight;
	}
	
    if (!$toWidth) {
		$xscale=$yscale;
	}
	
	if (!$toHeight) {
		$yscale=$xscale;
	}

    // Recalculate new size with default ratio
    if ($yscale>$xscale){
        $new_width = round($width * (1/$yscale));
        $new_height = round($height * (1/$yscale));
    }
    else {
        $new_width = round($width * (1/$xscale));
        $new_height = round($height * (1/$xscale));
    }

    return "src=\"${originalImage}\"  width=\"$new_width\" height=\"$new_height\" ";
}

function init_params($params)
{
$this->params = $params;

global $mainframe;


// $globalConfig = &JComponentHelper::getParams( 'com_content' );
// $globalConfig = &$mainframe->getParams('com_content');

//$this->globalConfig;
//if (!isset($globalConfig) ) {
        $com_content = &JComponentHelper::getComponent( 'com_content' );
        $this->globalConfig = /* new JParameter ( */$com_content->params /*)*/;
// }


//----- Parameters - Criteria ( 19 ) ------------------------------------------

// $set_access  =  $this->params->get('access', '' );

if ( !$this->params->get('set_count') ) {
        $this->params->set('set_count', 1000000000 );
}

// $set_date_today                 = $this->params->get( 'set_date_today', 0 );
// 5-10      5 - older than 5 days, newly than 10 days
// 5 newly than 5 days old
// $set_date_range                 = $this->params->get( 'set_date_range');

$this->publish_up_spec = "";
if ( substr($this->params->get( 'set_date_range'), 0, 1) == "p" ) {
                $this->params->set( 'set_date_newly', 0);
                $this->params->set( 'set_date_older', 0);
                $this->publish_up_spec = "p";
} else {
        $tokens = explode("-", $this->params->get( 'set_date_range'),2);
        if (count($tokens)==2) {
                $this->params->set( 'set_date_older', $tokens[0] );
                $this->params->set( 'set_date_newly', $tokens[1] );
        } else if ( count($tokens)==1 ) {
                $this->params->set( 'set_date_newly', $tokens[0] );
                $this->params->set( 'set_date_older', 0);
        }
}

//  Special Handling to get $set_date_month to work correctly
if ($this->params->get( 'set_date_month') != "") {
   if ($this->params->get( 'set_date_month') == "0") {
      $this->params->set( 'set_date_month', date( "m", time()+$this->tzoffset*60*60 ) );
   }
}
//---------------------------------------------------------------------

//  Special Handling to get $set_date_year to work correctly
if ($this->params->get('set_date_year') != "") {
   if ($this->params->get( 'set_date_year') == 0) {
      $this->params->set( 'set_date_year', date( "Y", time()+$this->tzoffset*60*60 ) );
   }
}

// $set_auto                       =  $this->params->get( 'set_auto' );
// $set_auto_author                =  $this->params->get( 'set_auto_author');

// TODO show_frontpage -> num value
$this->params->def( 'show_frontpage', "y" );

// $set_category_id_extra       =  $this->params->get( 'set_category_id_extra');
$this->set_category_id                =  $this->params->get( 'set_category_id', 0);

// $set_section_id_extra        =  $this->params->get( 'set_section_id_extra');
$this->set_section_id                 =  $this->params->get( 'set_section_id', 0);



$this->set_article_id =  array_filter(array_merge((array)($this->params->get( 'set_article_id')),
									 (array)($this->params->get( 'set_article_archived_id')),
									 explode(",", $this->params->get( 'set_article_id_extra')),
									 explode(",", $this->params->get( 'set_article_archived_id_extra'))));
									 
// $set_author_id                  =  $this->params->get( 'set_author_id');
// $set_author_name                =  $this->params->get( 'set_author_name');

// $minus_leading                  =  $this->params->get( 'minus_leading', 0 );
// $hide_current                   =  $this->params->get( 'hide_current', 0 );
//---------------------------------------------------------------------

//----- Parameters - Display ( 19 ) ------------------------------------------
$this->params->def('css_type', "content" );
if ( $this->params->get('css_type') == "dedicated" ) {
    $this->params->set('css_type', "");
}

// $show_image =  $this->params->get('image', 0);
// $image_align =  $this->params->get('image_align');
// $image_valign =  $this->params->get('image_valign', 0);
// $image_margin =  $this->params->get('image_margin');
$image_scale =  $this->params->def('image_scale', "scale");
// $image_scale =  $this->params->get('image_scale');
// $image_bg =  $this->params->get('image_bg', "#FFFFFF");
$this->params->def('image_width', 0);
// $image_width =  $this->params->get('image_width');
$this->params->def('image_height', 0);
// $image_height = $this->params->get('image_height');
$image_size =  $this->params->get('image_size');
if ($image_size <> "" and !$this->params->get('image_width')  and !$this->params->get('image_height') ) {
        $image_sizes = explode("x", $image_size);
        if ( isset($image_sizes[0]) && $image_sizes[0] > 0 ) {
                $this->params->set('image_width', $image_sizes[0]);
        }
        if ( isset($image_sizes[1]) && $image_sizes[1] > 0 ) {
                $this->params->set('image_height', $image_sizes[1]);
        } else {
                $this->params->set('image_height', $this->params->get('image_width') );
        }
}
if ($this->params->get('image_scale') == 1) {
	$this->params->set('image_height', 0);
} elseif ( $this->params->get('image_scale') == 2) {
	$this->params->set('image_height', 0);
}
// $image_scale =  $this->params->get('image_scale', 1);
// $image_num =  $this->params->get('image_num', 0);
// $link_image =  $this->params->get('link_image');

// $show_title_auto =  $this->params->get('show_title_auto');
// $use_modify_date =  $this->params->get('use_modify_date');
switch ($this->params->get('use_modify_date')) {
        case 1:  $this->created = "modified"     ; break ;;
        case 2:  $this->created = "publish_up"   ; break ;;
        case 3:  $this->created = "publish_down" ; break ;;
        default: $this->created = "created"      ; break ;;
}
// $created = $use_modify_date ? "modified" : "created";

// $show_more_auto =  $this->params->get('show_more_auto');
//---------------------------------------------------------------------

//----- Parameters - Display Modifier ( 14 ) --------------------------------

// $this->params->get('scroll_direction', "uuu");
// $scroll_mouse_ctrl =  $this->params->get('scroll_mouse_ctrl', "1");

// $scroll_height =  $this->params->get('scroll_height' , 100 );
// $scroll_speed =  $this->params->get(' ' , 1 );
// $scroll_delay =  $this->params->get('scroll_delay' , 30 );

// $show_title_nextline =  $this->params->get('show_title_nextline', 0 );

// $filter_text =  $this->params->get('filter_text');
// $length_limit_text =  $this->params->get('length_limit_text', 30 );

// $filter_title =  $this->params->get('filter_title');
// $length_limit_title =  $this->params->get('length_limit_title' );

// $format_date =  $this->params->get('format_date', JText::_('DATE_FORMAT_LC1'));

$this->params->def('link_section',  $this->globalConfig->get('link_section') );
$this->params->def('link_category', $this->globalConfig->get('link_category') );

$this->params->def('link_titles', $this->globalConfig->get('link_titles') );
// $link_text =  $this->params->get('link_text');
// $format =  $this->params->get('format', "%t<br>%s - %c<br>%d - %a<br>%b<br>%p%i<br>%m<span class=\"article_separator\"> </span>");
$this->params->def('row_template',
"(\$title_out!='' ? \"\$title_out\" : '').
(\$rate_out!='' ? \"\$rate_out<br/>\" : '').
(\$cat_out!='' ? \"\$cat_out\".'<br/>' : '').
(\$author_out!='' ? \"\$author_out\" : '' ).
(\$author_out!='' && \$date_out!='' ? ' - ' : '').
(\$date_out!='' ? \"\$author_out\" : '').
(\$author_out.\$date_out!='' ? '<br/>' : '').
(\$before_out!='' ? \"\$before_out<br/>\" : '').
(\$img_out!='' ? \"\$img_out\" : '').
(\$text_out!='' ? \"\$text_out\" : '').
(\$hits_out!='' ? \"(\$hits_out)\" : '').
(\$readmore_out!='' ? \"<br>\$readmore_out\" : '').
(!\$last? '<div class=\"item-separator\"></div>' : '')
" );


// $use_rows_template =  $this->params->get('use_rows_template', 1);

$this->params->def('module_template', "(\$mod_title_out != '' ? \"\$mod_title_out\" : '').
\$mod_cat_out.
\$scroll_start.
\$rows_out.
\$scroll_finish.
(\$mod_automore_out != '' ? \$mod_automore_out :'' )");

// $show_full_text =  $this->params->get('show_full_text', 0);


$this->params->def('ordering', "mostrecent");

$this->params->def('style', "flat");

$this->params->def('show_readmore', 2 );

// $this->moduleclass_sfx =  $this->params->get('moduleclass_sfx');

//----- Parameters - Display Text ( 10 ) -------------------------------------
// Allows for multilingual customisation //
// $text_module_description        =  $this->params->get('text_module_description');
// $text_readmore                          =  $this->params->get('text_readmore');
$this->params->def('text_more', JText::_('MOD_DN_MORE_ARTICLES') );
// $text_more                                      =  $this->params->get('text_more');

//$text_title_auto_pre          =  $this->params->get('text_title_auto_pre');
//$text_title_auto_suf          =  $this->params->get('text_title_auto_suf');

// $text_hover_section             =  $this->params->get('text_hover_section');
// $text_hover_category            =  $this->params->get('text_hover_category');
// $text_hover_title               =  $this->params->get('text_hover_title');
// $text_hover_readmore            =  $this->params->get('text_hover_readmore');
// $text_hover_more_section        =  $this->params->get('text_hover_more_section');
// $text_hover_more_category       =  $this->params->get('text_hover_more_category');

// $bottom_link_text =  $this->params->get('bottom_link_text' );
// $bottom_link_url =  $this->params->get('bottom_link_url');

$this->params->def('show_section', $this->globalConfig->get('show_section'));
$this->params->def('show_category_title', $this->globalConfig->get('show_category_title'));
$this->params->def('show_date', ($this->params->get('use_modify_date') == 1 ? $this->globalConfig->get('show_modify_date') : $this->globalConfig->get('show_create_date')) );
$this->params->def('show_title', $this->globalConfig->get('show_title') ) ;
$this->params->def('show_hits', $this->globalConfig->get('show_hits') );
$this->params->def('show_author', $this->globalConfig->get('show_author'));
$this->params->def('show_text', 1);
$this->params->def('show_vote', $this->globalConfig->get('show_vote') );

// $content_plugins   = !$this->params->get('plugins_disable');
$this->params->def('set_column', 1 );
// $set_column        =  $this->params->get('set_column');
/* if (!$set_column) {
        $set_column = 1;
} */
// $multi_column_order  =  $this->params->get('multi_column_order', 0 );

//---------------------------------------------------------------------

//  Conflict Handler

// $limit = "\n LIMIT ".$this->params->get( 'minus_leading', 0 ).",".$this->params->get('set_count');

// 
/* if ($this->params->get( 'set_section_id_extra')) {
	if ( !is_array($this->set_section_id) ) {
		$this->set_section_id = (array)$this->set_section_id;
	}

	$this->set_section_id = array_merge($this->set_section_id, explode( ',', $this->params->get( 'set_section_id_extra') ));
 } */





// if ( $this->set_category_id = $this->params->get( 'set_category_id_extra')) {
	// if ( !is_array($this->set_category_id)) {
		// $this->set_category_id = (array)$this->set_category_id;
	// }

	// $this->set_category_id = array_merge($this->set_category_id, explode( ',', $this->params->get( 'set_category_id_extra') ));
 // }

 
//---------------------------------------------------------------------

//---------------------------------------------------------------------

//  Functinality to allow text_hover to be blank by use if special character "#" entered
//  If not then space added to the end of the variables
/* modDisplayNewsHelper::dn_hovertext( $text_hover_section );
modDisplayNewsHelper::dn_hovertext( $text_hover_category );
modDisplayNewsHelper::dn_hovertext( $text_hover_title );
modDisplayNewsHelper::dn_hovertext( $text_hover_readmore );
modDisplayNewsHelper::dn_hovertext( $text_hover_more_section );
modDisplayNewsHelper::dn_hovertext( $text_hover_more_category );
modDisplayNewsHelper::dn_hovertext( $text_title_auto_pre );
modDisplayNewsHelper::dn_hovertext( $text_title_auto_suf ); */
//---------------------------------------------------------------------

// $blog = $section_link_blog ? "blog" : "";

$this->view = JRequest::getCmd('view');
// echo "DEBUG:".$this->view ;

$db             =& JFactory::getDBO();


// If { set_auto = y } then Module will automatically determine section/category id of current page and use this to control what news is dsiplayed
if ($this->params->get( 'set_category_type') == 1) {

	if ($this->view == "section") {
		$temp                           = JRequest::getString('id');
		$temp                           = explode(':', $temp);
		$zsectionid         = $temp[0];
		$this->set_section_id     = $zsectionid;
		// $set_section_exclude = 0;
		$this->params->def('set_section_exclude', 0);
	} elseif ($this->view == "category") {
		$temp                           = JRequest::getString('id');
		$temp                           = explode(':', $temp);
		$zcategoryid        = $temp[0];
		$this->set_category_id = $zcategoryid;
		// $set_category_exclude = 0;
		// $this->params->def('set_category_exclude', 0);
	} elseif ($this->view == "article") {
		$temp                           = JRequest::getString('id');
		$temp                           = explode(':', $temp);
		$zcontentid         = $temp[0];

		$temp = & JTable::getInstance( 'content' );
		$temp->load( $zcontentid );
		$this->set_category_id = $temp->catid;
		// $set_category_exclude = 0;
		// $this->params->def('set_category_exclude', 0);
	} else {
		$this->set_category_id = false;
	}
	
	// echo "DEBUG:".$this->set_category_id."<br/>";
}

// Find related items
if ( $this->params->get( 'set_related', 0 ) ) {

	$this->likes = array ();
	
	$option				= JRequest::getCmd('option');
	// $view				= JRequest::getCmd('view');

	$temp				= JRequest::getString('id');
	$temp				= explode(':', $temp);
	$id					= $temp[0];

	if ($option == 'com_content' && $this->view == 'article' && $id)
	{

		// select the meta keywords from the item
		$query = 'SELECT metakey' .
				' FROM #__content' .
				' WHERE id = '.(int) $id;
		$db->setQuery($query);

		if ($metakey = trim($db->loadResult()))
		{
			// explode the meta keys on a comma
			$keys = explode(',', $metakey);
			// $likes = array ();

			// assemble any non-blank word(s)
			foreach ($keys as $key)
			{
				$key = trim($key);
				if ($key) {
					$this->likes[] = ',' . $db->getEscaped($key) . ','; // surround with commas so first and last items have surrounding commas
				}
			}
		}
	}
	
	if (!$this->likes) {
		return false;
	}
}

// Find by metakeys
if ( $this->params->get( 'set_metakeys', '' ) ) {

	$this->metakeys = array ();
	
	// explode the meta keys on a comma
	$keys = explode(',', $this->params->get( 'set_metakeys', '' ) );

	// assemble any non-blank word(s)
	foreach ($keys as $key)
	{
		$key = trim($key);
		if ($key) {
			$this->metakeys[] = ',' . $db->getEscaped($key) . ','; // surround with commas so first and last items have surrounding commas
		}
	}
	
}

// If { set_auto_author = y } then Module will automatically determine Author id of current page and use this to control what news is dsiplayed
if ($this->params->get( 'set_auto_author')) {

	if ( $this->params->get( 'set_auto_author') == 3 ) {
		$user =& JFactory::getUser();
		if (!$user->guest) {
			$this->params->set( 'set_author_id', $user->id);
		} else {
			$this->params->set( 'set_author_id', -1);
		}
    } elseif ($this->view == "article") {
		$temp                           = JRequest::getString('id');
		$temp                           = explode(':', $temp);
		$zcontentid         = $temp[0];

		$result = null;
		$query = "SELECT created_by_alias, created_by, title FROM #__content WHERE id = '$zcontentid'";
		$db->setQuery($query);
		$result = $db->loadObject();
		
		


		switch ( $this->params->get( 'set_auto_author') ) {
		case 1: // by article author
				if ( $result->created_by_alias ) {
						$this->params->set( 'set_author_name', array($result->created_by_alias) );
				} else {
						$db->setQuery("SELECT name FROM #__users WHERE id = ".$result->created_by );
						$result = $db->loadObject();
						$this->params->set( 'set_author_name', array($result->name) );
				}
				break;

		case 2: // by article name
				$this->params->set('set_author_name', array($result->title));
				break;
		}
	} else {
			return false;
	}
}

if ($this->view == "article") {
                $temp                           = JRequest::getString('id');
                $temp                           = explode(':', $temp);
        $this->currcontentid      = $temp[0];
}

return true;

}

function query()
{

global $mainframe;
$config =& JFactory::getConfig();
$tzoffset = $config->getValue('config.offset');


$my =& JFactory::getUser();
$tag = JFactory::getLanguage()->getTag();
$app = JFactory::getApplication();
// echo"DEBUG: ".$app->isSite().":".$tag."<br/>";



$set_access = $this->params->get('set_access');


$authorised = JAccess::getAuthorisedViewLevels(JFactory::getUser()->get('id'));
$authorised = implode(",",$authorised);

 
if ( $set_access ) {
	
	$set_access = implode(",",$set_access);
}

 


//  Special variable used for management of different access levels




//  Handling required to create set Names, '' added
//---------------------------------------------------------------------

//---------------------------------------------------------------------

######################################################################################################################################

//  Main Query & Array
switch ( $this->params->get('ordering') ) {
case "mostread":
   $order_by = "a.hits DESC";
   break;
case "publish_up":
   $order_by = "a.publish_up DESC";
   break;
case "publish_down":
   $order_by = "publish_down_isnull asc, a.publish_down asc";
   break;
case "ordering":
   $order_by = "a.ordering ASC";
   break;
case "frontpageordering":
   $order_by = "b.ordering ASC";
   break;
case "title":
   $order_by = "a.title ASC";
   break;
case "mostold":
   $order_by = "created_isnull ASC, a.created ASC";
   break;
case "random":
   $order_by = "RAND()";
   break;
case "rating":
   $order_by = "(v.rating_sum / v.rating_count) DESC, v.rating_count DESC";
   break;
case "voting":
   $order_by = "v.rating_count DESC, (v.rating_sum / v.rating_count) DESC";
   break;
case "recentlymodified":
	$order_by = "a.modified DESC";
	break;
case "set_articles":
	$order_by = 'FIELD(a.id,'.implode(",", $this->set_article_id).')';
	break;
case "mostjcommented":
	if ( $this->params->get('jcomments') ) {
		$order_by = "jcounter DESC";
	}
	break;
case "recentjcommented":
	if ( $this->params->get('jcomments') ) {
		$order_by = "jc.id DESC";
	}
	break;
case "mostrecent":
default:
   $order_by = "a.created DESC";
}

$date =& JFactory::getDate();
$now = $date->toMySQL();

$db =& JFactory::getDBO();
$nullDate = $db->getNullDate();


#modDisplayNewsHelper::dn_set_name( $set_section_id );
#modDisplayNewsHelper::dn_set_name( $set_category_id );
// $set_author_name_for_select = modDisplayNewsHelper::dn_set_name( $this->params->get( 'set_author_name') );


$query = "SELECT a.id".

( $this->params->get('on_prepare_content_plugins') ? ", a.*" : "" ).
                ', CASE WHEN CHAR_LENGTH(a.alias) THEN CONCAT_WS(":", a.id, a.alias) ELSE a.id END as slug'.
                ', CASE WHEN CHAR_LENGTH(cc.alias) THEN CONCAT_WS(":", cc.id, cc.alias) ELSE cc.id END as catslug'.
                ', a.attribs'.
($this->params->get('show_title') ? ", a.title" : "" ).
($this->params->get('show_text')  ? ", a.introtext as introtext" : "" ).
// (($show_text &&  $show_full_text) ? ", CONCAT(a.introtext, a.fulltext ) as text" : "" ).
( ($this->params->get('show_text') > 1 || $this->params->get('show_readmore') == 2 ) ? ", a.fulltext" : "" ).
                          ", a.sectionid ".
                          ", a.catid ".
($this->params->get('show_date')   ? ", a.".$this->created." as created" : "" ).
($this->params->get('ordering') == "publish_down" ? ', IF(publish_down = "0000-00-00 00:00:00", 1, 0) AS publish_down_isnull ' : '' ).
($this->params->get('ordering') == "mostold"      ? ', IF(a.'.$this->created.' = "0000-00-00 00:00:00", 1, 0) AS created_isnull ' : '' ).
($this->params->get('show_title_auto') || $this->params->get('show_author') ? ', CASE WHEN CHAR_LENGTH(a.created_by_alias) THEN created_by_alias ELSE c.name END as author' : '' ).
($this->params->get('show_hits')   ? ", a.hits" : "" ).
($this->params->get('image') ? ", a.images" : "" )
.($this->params->get('show_vote') ? ",round( v.rating_sum / v.rating_count ) AS rating, v.rating_count" : "" )

.( $this->params->get('show_title_auto') || $this->params->get('show_more_auto') ||  $this->params->get('show_section')  || $this->params->get('show_category_title') || $this->params->get( 'set_auto' ) ?
                                        // d.id as sec_id, d.title as sec_title, d.published as sec_published,
                                        ', cc.title as cat_title, cc.alias as cat_alias, cc.published as cat_published ' : '' )
.($this->params->get('show_description') ? ", cc.description as cat_description " : "" )										
.($this->params->get('show_description_image') ? ", cc.params as cat_params" :"" )
.($this->params->get('jcomments') && $this->params->get('show_jcomment_counter') ? ", count(jc.published) as jcounter" : "" )										
.                                                               "\n FROM #__content AS a"
. ( ($this->params->get( 'show_frontpage' ) == "n" || $this->params->get( 'show_frontpage' ) == "only" ) ? "\n LEFT JOIN #__content_frontpage AS b ON b.content_id = a.id" : "" )
. ( ( $this->params->get( 'set_author_name') || $this->params->get('show_author') )            ? "\n JOIN #__users AS c ON c.id = a.created_by" : "" )
. ( ( $this->params->get( 'jcomments') )            ? "\n LEFT JOIN #__jcomments AS jc ON jc.object_id = a.id AND jc.object_group = 'com_content' AND jc.published <> 0 " : "" )


.  "\n LEFT JOIN #__categories AS cc ON cc.id = a.catid"
// .  "\n LEFT JOIN #__sections AS d ON d.id = a.sectionid"
   . ( ($this->params->get('show_vote') || $this->params->get('ordering') == "rating" || $this->params->get('ordering') == "voting" ) ?
                                                                "\n LEFT JOIN #__content_rating AS v ON a.id = v.content_id" : "" )
   .                                                            "\n  WHERE (a.state IN (".$this->params->get('set_state', "1")."))"
	. ($app->getLanguageFilter() ? " AND a.language in ('". $tag . "','*')" : "")
	. ($app->getLanguageFilter() ? " AND cc.language in ('". $tag . "','*')" : "")
	. ( ($this->publish_up_spec == "" )?       "\n  AND (a.publish_up = ".$db->Quote($nullDate)." OR a.publish_up <= ".$db->Quote($now)."  )" : "")
   . ( ($this->publish_up_spec == "p" )?      "\n  AND ( a.publish_up > ".$db->Quote($now)."  )" : "")
   .                                                            "\n  AND (a.publish_down = ".$db->Quote($nullDate)." OR a.publish_down >= ".$db->Quote($now)."  )"
//   .                                                            "\n AND (a.sectionid=0 OR d.published = '1')"
   .                                                            "\n AND (a.catid=0 OR cc.published = '1')"
   .( ($this->params->get( 'set_related', 0 ) && $this->likes ) ? ' AND ( CONCAT(",", REPLACE(a.metakey,", ",","),",") LIKE "%'.implode('%" OR CONCAT(",", REPLACE(a.metakey,", ",","),",") LIKE "%', $this->likes).'%" )' : '' ) 
   .( ($this->params->get( 'set_metakeys', 0 ) && $this->metakeys ) ? ' AND ( CONCAT(",", REPLACE(a.metakey,", ",","),",") LIKE "%'.implode('%" OR CONCAT(",", REPLACE(a.metakey,", ",","),",") LIKE "%', $this->metakeys).'%" )' : '' ) 
   . ($this->set_section_id ?         "\n   AND (a.sectionid ".($this->params->get( 'set_section_exclude', 0 ) ? "NOT" : "" )." IN (".(is_array($this->set_section_id) ? implode(",",$this->set_section_id) : $this->set_section_id) .") )" : '')
//    . ( $this->set_category_id ?       "\n   AND (a.catid ".($this->params->get( 'set_category_type' )==2 ? "NOT" : "" )." IN ( ".(is_array( $this->set_category_id ) ? implode(",",$this->set_category_id) : $this->set_category_id )." ) )" : '')
   . ( ($this->params->get( 'set_category_type' )==1 and $this->set_category_id ) ?  "\n   AND (a.catid = ".$this->set_category_id." )" : '')
   . ( ($this->params->get( 'set_category_type' )==1 and $this->set_category_id == "" ) ?  "\n   AND  FALSE" : '')
   . ( ($this->params->get( 'set_category_type' )==2 and $this->set_category_id ) ?  "\n   AND (a.catid IN ( ".implode(",",$this->set_category_id)." ) )" : '')
   . ( ($this->params->get( 'set_category_type' )==3 and $this->set_category_id ) ?  "\n   AND (a.catid NOT IN ( ".implode(",",$this->set_category_id)." ) )" : '')
   . ($this->params->get( 'show_frontpage' ) == "n" ?                                  "\n  AND (b.content_id IS NULL)" : '')
   . ($this->params->get( 'show_frontpage' ) == "only" ?                               "\n  AND (b.content_id = a.id)" : '')
   . (($this->set_article_id && $this->params->get( 'set_article_type')==0)?  "\n  AND (a.id IN (".implode(",", $this->set_article_id).") )" : '')
   . (($this->set_article_id && $this->params->get( 'set_article_type')==1)?  "\n  AND (a.id NOT IN (".implode(",", $this->set_article_id).") )" : '')
   . ($this->params->get( 'hide_current' ) && $this->view == "article"?                      "\n  AND (a.id <> (".$this->currcontentid.") )" : '')
//   . ($this->params->get( 'set_author_id') <> "" ?                                            "\n  AND (a.created_by IN (".$this->params->get( 'set_author_id').") )" : '')
   . ($this->params->get( 'set_author_name') ?                                  "\n  AND (CASE WHEN CHAR_LENGTH(a.created_by_alias) THEN created_by_alias ELSE c.name END IN ('".implode("', '", $this->params->get( 'set_author_name'))."') )" : '')
   . ($this->params->get( 'set_date_newly' ) ?                                 "\n  AND (TO_DAYS(ADDDATE(".$db->Quote($now).", INTERVAL ".$this->tzoffset." HOUR)) - TO_DAYS(ADDDATE(".$this->created.", INTERVAL ".$this->tzoffset." HOUR)) <= '".$this->params->get( 'set_date_newly' )."' )" : '')
   . ($this->params->get( 'set_date_older' ) ?                                 "\n  AND (TO_DAYS(ADDDATE(".$db->Quote($now).", INTERVAL ".$this->tzoffset." HOUR)) - TO_DAYS(ADDDATE(".$this->created.", INTERVAL ".$this->tzoffset." HOUR)) >= '".$this->params->get( 'set_date_older' )."' )" : '')

   . ($this->params->get( 'set_date_today') ?                                         "\n   AND (TO_DAYS(ADDDATE(".$db->Quote($now).", INTERVAL ".$this->tzoffset." HOUR)) = TO_DAYS(ADDDATE(".$this->created.", INTERVAL ".$this->tzoffset." HOUR)))" : '')
   . ($this->params->get( 'set_date_month') ?                                         "\n  AND (".$this->params->get( 'set_date_month')." = MONTH(ADDDATE(".$this->created.", INTERVAL ".$this->tzoffset." HOUR)))" : '')
   . ($this->params->get( 'set_date_year') ?                                  "\n  AND (".$this->params->get( 'set_date_year')."  = YEAR(ADDDATE(".$this->created.", INTERVAL ".$this->tzoffset." HOUR)))" : '')
//   . ( $this->params->get('access') == ""  ? "\n AND a.access <= '".$my->get('gid')."'" : '' )
   . ( $set_access == "" ? "\n AND a.access <= '".$authorised."'" : '' )
   . ( $set_access <> "" ? "\n AND (a.access IN ( ".$set_access." ) )" :
   '')


   .($this->params->get('jcomments') ? " group by a.id" : "" )	

#******************************************#
//  This Controls the fact that this module displayes the Latest News first
   . "\n  ORDER BY $order_by"
#******************************************#
   . "\n LIMIT ".$this->params->get( 'minus_leading', 0 ).",".$this->params->get('set_count');


   return $query;
   }
   
   
function main(&$params)
{

if ( $this->init_params($params) === false ) {
	return;
}

static $id=0;
$this->id = $id;

$config =& JFactory::getConfig();
$jtzoffset = $config->getValue('config.offset');


$datenow = new JDate('now', $jtzoffset);

/* echo "TZ: ".$jtzoffset . "<br>";
echo "NOW: ".$datenow->toUnix(). "<br>";
// $datenow->setOffset($this->tzoffset);
// echo "TZNOW: ".$datenow. "<br>";*/
$dbdatenow = new JDate($datenow->toMySQL(), $jtzoffset);
// echo "DB NOW: ".$dbdatenow->toUnix(). "<br>"; 


$this->tzoffset = ($datenow->toUnix() - $dbdatenow->toUnix()) / 3600 ;
// echo "HR: ".$this->tzoffset. "<br>";



$query = $this->query();
$db =& JFactory::getDBO();
$db->setQuery( $query );

$rows = $db->loadObjectList();

if (is_null($rows) && $this->params->get('debug')) {
		$jAp=& JFactory::getApplication();
		$jAp->enqueueMessage(nl2br($db->getErrorMsg()),'error'); 
		return;
}
		
######################################################################################################################################


   $mod_start_out = "";
   $mod_end_out = "";
   $rows_out = "";
   	$use_table = false;
	$mod_title_out = $mod_automore_out = '';
   //  Error checker, that tests whether any data has resulted from the query
//  If not an Error message is displayed

  $scroll_start = '';
  $scroll_finish = '';
if ($rows <> NULL) {

      // Code for displaying of individual items Section
	$this->import_content_plugins();
	$mod_automore_out = $this->mod_automore_out($rows[0]);
    // $mod_title_out = $this->mod_title_out($rows[0]);
	if ( $this->params->get('show_title_auto') ) {
		$mod_title_out = str_replace(array("%a","%c"), array($rows[0]->author, $rows[0]->cat_title), $this->params->get('mod_title_format'));
	}

	$mod_cat_out = (($this->params->get('show_category')==2 ) ?	$this->cat_out($rows[0]) : "");

	// $mod_descr_out = $this->mod_descr_out($rows[0]);
   //---------------------------------------------------------------------

   // $mod_start_out .= "\n<!-- START '".$this->version."' -->\n";


 
   // Activates scrolling text ability
   switch ($this->params->get('scroll_direction')) {
		case "paging":

			static $pausecontroler = 0;
			if ( !$pausecontroler ) {
				$pausecontroler = 1;
				$document 	= &JFactory::getDocument();
				$document->addScript( JURI::base( true ).'/modules/mod_dn/pausecontroler.js' );
				$document->addStyleDeclaration( '
#pscroller'.$this->id.'{
height: '.$this->params->get('scroll_height' , 100 ).'px;
}' );

			}
			
			$scroll_start .= '<script type="text/javascript">var pausecontent'.$this->id.'=new Array()</script>';








			// $scroll_start .= '<div height="'.$this->params->get('scroll_height' , 100 ).'" style="overflow: scroll; white-space: nowrap; marquee: slide infinite;">';
			break;

		case "hashbangcode_scrolling_up":
			$scroll_start .= '<script type="text/javascript">
// <!--
var speed'.$this->id.' = '.$this->params->get('scroll_speed' , 1 ).';
function init'.$this->id.'(){
  var el = document.getElementById("marquee_replacement'.$this->id.'");
  el.style.overflow = "hidden";
  // el.scrollTop = '.$this->params->get('scroll_height' , 100 ).';
  setTimeout("scrollFromBottom'.$this->id.'()",'.$this->params->get('scroll_delay' , 30 ).');
}
 
var go'.$this->id.' = 0;
var timeout = "";
function scrollFromBottom'.$this->id.'(){
  clearTimeout(timeout);
  var el = document.getElementById("marquee_replacement'.$this->id.'");
  if(el.scrollTop >= el.scrollHeight-'.$this->params->get('scroll_height' , 100 ).'){
    el.scrollTop = 0;
  };
  el.scrollTop = el.scrollTop + speed'.$this->id.';
  if(go'.$this->id.' == 0){
    timeout = setTimeout("scrollFromBottom'.$this->id.'()",'.$this->params->get('scroll_delay' , 30 ).');
  };
}
 
function stop'.$this->id.'(){
  go'.$this->id.' = 1;
}
 
function startit'.$this->id.'(){
  go'.$this->id.' = 0;
  scrollFromBottom'.$this->id.'();
}
// -->
</script>

        <style type="text/css"> 
#marquee_replacement'.$this->id.'{
 height:'.$this->params->get('scroll_height' , 100 ).'px;
 overflow:auto;
}
#marquee_replacement'.$this->id.' div.leading_spacer{
 height:'.$this->params->get('lead_space' , 50 ).'px;
}
#marquee_replacement'.$this->id.' div.tailing_spacer{
 height:'.$this->params->get('tail_space' , 80 ).'px;
}
</style> 
        <style type="text/css"> 
        code {
            overflow: auto; /*--If the Code exceeds the width, a scrolling is available--*/
            overflow-Y: hidden;  /*--Hides vertical scroll created by IE--*/
        }
        </style>
		<div id="marquee_replacement'.$this->id.'"';

		if ( $this->params->get('scroll_mouse_ctrl', 1) ) {
			$scroll_start .= 'onmouseout="startit'.$this->id.'();" onmouseover="stop'.$this->id.'();" ';
		}
		$scroll_start .= 'style="overflow-x: hidden; overflow-y: hidden;">
		<div class="leading_spacer"></div>';
			break;
		case "up":
		case "down":
		case "left":
		case "right":
			$scroll_start .= "<marquee behavior=\"scroll\" direction=\"".$this->params->get('scroll_direction')."\" height=\"".$this->params->get('scroll_height' , 100 )."\" scrollamount=\"".$this->params->get('scroll_speed' , 1 )."\" scrolldelay=\"".$this->params->get('scroll_delay' , 30 )."\" ";
			if ( $this->params->get('scroll_mouse_ctrl', 1) ) {
				$scroll_start .=  "onmouseover=\"this.stop()\" onmouseout=\"this.start()\" ";
			}
			$scroll_start .=  " >";
			break;
		default:
		}
		

    //---------------------------------------------------------------------


		// $dnwhole_class = modDisplayNewsHelper::dn_style("dn-whole");
        switch ($this->params->get('style')) {
        case 'blog':
                $mod_start_out .= "\n<div class=\"blog".$this->params->get('moduleclass_sfx')."\">\n";
                break;
        case 'featured':
                $mod_start_out .= "\n<div class=\"blog-featured".$this->params->get('moduleclass_sfx')."\">\n";
                break;
        case 'horiz':
				$mod_start_out .= "\n<div>\n";
                break;
        case 'vert':
        case 'flat':
        case 'latestnews':
		case 'flatlist':
				$mod_start_out .= "\n<div style=\"display: table; width: 100%; table-layout: float; \">";
                break;
        }

		switch ($this->params->get('style') ) {
        case 'vert':
        case 'horiz':
        case 'blog':
        case 'featured':
		case 'flat':
		case 'latestnews':
		case 'flatlist':
			$mod_end_out .= "</div>\n"; // dn-whole
			break;
		}

		switch ( $this->params->get('scroll_direction') ) {
			case "paging":
				$scroll_finish = '<script type="text/javascript">
	new pausescroller(pausecontent'.$this->id.', "pscroller'.$this->id.'", "someclass", '.($this->params->get('scroll_speed' , 1 )*1000).', '.$this->params->get('scroll_mouse_ctrl', "1").' )
	</script>';
				break;
			case "hashbangcode_scrolling_up":
				$scroll_finish = '<div class="tailing_spacer"></div>
	</div>
	<script>init'.$this->id.'();</script>';
				break;
			case "up";
			case "down";
			case "left";
			case "right";
				$scroll_finish = "</marquee>";
				break;
			default:
				$scroll_finish = '';
		}

   //---------------------------------------------------------------------

   $mod_end_out .= "\n";

/*    if ( $this->params->get('bottom_link_text' ) && $this->params->get('bottom_link_url') ) {
 
	  $mod_end_out .= modDisplayNewsHelper::create_link( $this->params->get('bottom_link_url'), 
											$this->params->get('bottom_link_text'),
											"dn-module_link",
											$this->params->get('bottom_link_text') );
	  
	  
   } */
   //---------------------------------------------------------------------

   //---------------------------------------------------------------------

}

   // $mod_end_out .= "\n<!-- END '".$this->version."' -->\n";
   $rows_count = count($rows);

   $vr = (int)(($rows_count+$this->params->get('set_column')-1)/$this->params->get('set_column'));

/*        if ( ($use_table || $this->params->get('set_column') > 1)  && ($this->params->get('style') == 'vert') ) {
                $newrows = array();

                for ( $i = 0; $i < $vr; $i++ ) {
                        for ( $j = 0; $j < $this->params->get('set_column'); $j++) {
                            // print ($i+$j*$vr);                              print "\n";
                                if ($i+$j*$vr < $rows_count) {
                                        $newrows[] = & $rows[$i+$j*$vr];
                                }

                        }
                }

                $rows = $newrows;
        } */



   

   // Start of Loop //
   $k = 0;
   $r = 0;
   $c = 0;
   $v = 0;
	$sc = $this->params->get('set_column',1);
	if ($this->params->get('style') == 'latestnews' or 
		$this->params->get('style') == 'vert' or 
		$this->params->get('style') == 'flat' or 
		$this->params->get('style') == 'flatlist' ) {
		$sc = ceil(count($rows)/$sc);
	}

    foreach ($rows as $row) {

      $r++;
	  
	  $last = (count($rows) == $r);

		switch ($this->params->get('style')) {

		case 'horiz':
		case 'blog':
		case 'featured':
			$vr=ceil($r/$sc)-1;
			$vc=$r-($vr)*$sc;

			$fc = (int)($vc==1);
			$lc = (int)($vc==$sc or $last);

			// echo "DEBUG: r:$r vr:$vr vc:$vc fc:$fc lc:$lc<br />";
			break;
			

		case 'vert':
		case 'flat':		
		case 'latestnews':
		case 'flatlist':

		
			// $sc = ceil(count($rows)/$this->params->get('set_column',1));
			// $sc = floor(count($rows)/$this->params->get('set_column',1));
			
			
		
			$vc=ceil($r/$sc)-1;
			$vr=$r-($vc)*$sc;

			$fr = (int)($vr==1);
			$lr = (int)($vr==$sc or $last);

			// echo "DEBUG: r:$r vc:$vc vr:$vr fr:$fr lr:$lr sc:$sc<br />";			
			if ($lr) {
				$sc = ceil((count($rows)-$r+1)/$this->params->get('set_column',1));
			}
			break;
		}
	  
      $v++;

      $row_out = "";

          $row_start_out = "";
      // $row_start_out .= "\n\t";
	  

	  
        $aparams = new JRegistry();
		$aparams->loadJSON($row->attribs);
		
		if ( $this->params->get('article_link') ) {
			$aroute = modDisplayNewsHelper::fixItemId(ContentHelperRoute::getCategoryRoute($row->catid), $this->params->get('item_id_cat_type'), $this->params->get('item_id_cat'));
		} else {
			$aroute = $aroute = modDisplayNewsHelper::fixItemId(ContentHelperRoute::getArticleRoute($row->slug, $row->catid ), $this->params->get('item_id_type'), $this->params->get('item_id'));
		}

        $row->text = "";
        if ( $this->params->get('show_text') ) {
                if ( $this->params->get('show_text') > 1 ) {
                    if ($aparams->get('show_intro', $this->globalConfig->get('show_intro'))) {
                                $row->text .= $row->introtext;
            }
            $row->text .= " ".$row->fulltext;
                } else {
                        $row->text .= $row->introtext;
                }
        }


		switch ($this->params->get('style')) {

			case 'horiz':
				if ($fc)  {
					$row_start_out .= "\n<div style=\"display: table; width: 100%; table-layout: float; \" >";
				}
				$row_start_out .= "<div style=\"display: table-cell;  width: ".ceil(100/$this->params->get('set_column',1))."%; \">\n";
				break;
			case 'blog':
			case 'featured':
				if ($fc)  {
					$row_start_out .= "<div class=\"items-row cols-$sc row-$vr\" >\n";
				}
				$row_start_out .= "<div class=\"item column-$vc\">\n";
				break;
			case 'vert':
				if ($fr)  {
					$row_start_out .= "<div style=\"display: table-cell;  width: ".ceil(100/$this->params->get('set_column',1))."%; \">\n";
				}
				$row_start_out .= "<div>\n";
				break;
			case 'flat':
				if ($fr)  {
					$row_start_out .= "<div style=\"display: table-cell;  width: ".ceil(100/$this->params->get('set_column',1))."%; \">\n";
//					$row_start_out .= "<div valign=\"top\" class=\"".( $vc ? "column_separator" : "" )."\" >";
				}
				$row_start_out .= "<div>";
				break;
			case 'latestnews':
				if ($fr)  {
					$row_start_out .= "<div style=\"display: table-cell;  width: ".ceil(100/$this->params->get('set_column',1))."%; \">\n";
//					$row_start_out .= "<div valign=\"top\" class=\"".( $c > 1 ? "column_separator" : "" )."\" >";
					$row_start_out .= "<ul class=\"latestnews\">";
				}
				$row_start_out .= "<li>";
				break;
			case 'flatlist':
				if ($fr)  {
					$row_start_out .= "<div style=\"display: table-cell;  width: ".ceil(100/$this->params->get('set_column',1))."%; \">\n";
//					$row_start_out .= "<div valign=\"top\" class=\"".( $c > 1? "column_separator" : "" )."\">";
					$row_start_out .= "<ol start=$r>";

				}
				$row_start_out .= "<li>";
				break;
        }
		
        $row_end_out = "";
		switch ($this->params->get('style')) {
			case 'horiz':
			case 'blog':
			case 'featured':
            // $row_end_out .= '<span class="article_separator">&nbsp;</span>';
            $row_end_out .= "</div>\n";
            if ( $lc ) {
			    $row_end_out .= "<div class=\"row-separator\"></div>";
				$row_end_out .= "</div>";
            }
            break;
      case 'flat':
            // $row_end_out .= '<span class="article_separator">&nbsp;</span>';
            $row_end_out .= '</div>';
            if ($lr) {
				$row_end_out .= "</div>";
            }
            break;
		case 'vert':
            // $row_end_out .= '<span class="article_separator">&nbsp;</span>';
            $row_end_out .= "</div>\n";
            if ( $lr ) {
			    // $row_end_out .= "<span class=\"row-separator\"></span>";
				$row_end_out .= "</div>";
            }
		break;
      case 'flatlist':
			$row_end_out .= '</li>';
            if ( $lr ) {
                        $row_end_out .= "</ol>";
						$row_end_out .= "</div>";
            }
            break;
          case 'latestnews':
			$row_end_out .= '</li>';
            if ( $lr ) {
                $row_end_out .= "</ul>";
				$row_end_out .= "</div>";
            }
            break;
        }

		// Start of Module Display for each News Item

      if ( $this->params->get('css_type') == "table" ) {
              $k = 1 - $k;
          }

      //---------------------------------------------------------------------



		$before_out = $this->before_out($row, $aparams);
		if ($this->params->get('on_prepare_content_plugins')==1 ) {
			$this->onPrepareContent($row, $aparams);
		}
		$cat_out = (($this->params->get('show_category')==1 ) ?	$this->cat_out($row) : "");
		// echo "DEBUG:$cat_out<br>";
		$date_out = $this->date_out($row, $aparams);
		$author_out = $this->author_out($row, $aparams);
		$title_out  = $this->title_out($row, $aroute);
		$hits_out = $this->hits_out($row);
		$rate_out = $this->rate_out($row);
		list( $text_out, $img_out) = $this->text_out($row, $aroute);
		if ($this->params->get('on_prepare_content_plugins')==2 ) {
			$this->onPrepareContent($row, $aparams);
		}
		$readmore_out = $this->readmore_out($row, $aroute, $aparams);
		$jcomments_out = $this->jcomments_out($row);
				
		// $read_more_shown = 1;

        if ( ! $this->params->get('use_rows_template', 1) ) {

                // $read_more_shown = 0;
        $pf =0;
		$format = $this->params->get('format', "%t<br>%s - %c<br>%d - %a<br>%b<br>%p%i<br>%m<div class=\"item-separator\"> </div>");
		$row_out = str_replace(array("%s","%c","%d","%t","%h","%a","%p","%b","%i","%r","%m","%C"), 
								array($cat_out,$cat_out,$date_out,$title_out,$hits_out, $author_out, $img_out, $before_out, $text_out, $rate_out, $readmore_out, $jcomments_out), 
								$format);
        /* for ( $i=0; $i < strlen( $format); $i += 1 ) {
            if ( $format[$i] == "%" ) {
               $pf = 1;
            } else {
               if ( $pf==1 ) {
                  $pf = 0;
                  switch ( $format[$i] ) {
                  case "s":
                     $row_out .= $sec_out;
                     break;
                  case "c":
                     $row_out .=  $cat_out;
                     break;
                  case "d":
                     $row_out .= $date_out;
                     break;
                  case "t":
                     $row_out .= $title_out;
                     break;
                  case "h":
                     $row_out .= $hits_out;
                     break;
                  case "a":
                     $row_out .= $author_out;
                     break;
                  case "p":
                     $row_out .= $img_out;
                     break;
                  case "b":
                     $row_out .=  $before_out;
                     break;
                  case "i":
                     $row_out .= $text_out;
                     break;
                  case "r":
                     $row_out .= $rate_out;
                     break;
                  case "m":
                     $row_out .= $readmore_out;
                     // $read_more_shown = 1;
                     break;
                  case "C":
                     $row_out .= $jcomments_out;
                     break;
                  case "%":
                     echo "%";
                     break;
                  default:
                  } // switch
               } else {
                  $row_out .= $format[$i];
               } // if ( pf
            } // if ( $format[i] == "%" )
            // echo $out;
         } // for */
                } else {
						$style = $this->params->get('style');
						eval("\$row_out = ".str_replace('"', '"', $this->params->get('row_template')).";");
                //eval("\$str = \"$str\";");
                }



         // echo "rows_count=$rows_count r=$r set_column=$set_column c=$c <br>";

          /* if (!$read_more_shown) {
                        $row_end_out .= $readmore_out; // read more is not element of format, but should be printed at the end of each content entry
          } */


		
	   if ($this->params->get('scroll_direction') == "paging" ) {
			$row_start_out = '<script type="text/javascript">pausecontent'.$this->id.'['.($r-1).']=\''.str_replace(array("'","\n","\r"), array("\'","",""), $row_start_out);
			$row_out = str_replace(array("'","\n","\r"), array("\'","",""), $row_out);
			$row_end_out = str_replace(array("'","\n","\r"), array("\'","",""), $row_end_out).'\'</script>
';
	   }
		
        $rows_out .= $row_start_out;
		$rows_out .= $row_out;
        $rows_out .= $row_end_out;

          // echo "v=$v vr=$vr<br>";

	}

	// echo "DEBUG:$c<br/>";
	if ( $rows_out == '' and !$this->params->get('') ) {
		return;
	}

	if ($this->params->get('scroll_direction') != "paging" ) {
	
	/* switch ($this->params->get('style') ) {
	case 'flat':
	case 'latestnews':
	case 'flatlist':
		if ($use_table || $this->params->get('set_column') > 1) {
			if ( $c != 0 ) {
				while ( $c < $this->params->get('set_column')) {
					$c ++;
					$rows_out .= "<td>&nbsp;</td>";
				}
			}
		}		
		break;
	default:
		if ( $c != 0 ) {
			while ( $c < $this->params->get('set_column')) {
				$c ++;
				$rows_out .= "<td>&nbsp;</td>";
			}
			$rows_out .= "</tr>";
		}
	} */
	
	}
	


	// End of Loop //
	if ($rows_out != '' ) {
		$rows_out=$mod_start_out.$rows_out.$mod_end_out;
	}

 	$out = '';
	
	

	{
	
		// echo "DEBUG: ".$this->params->get('use_module_template')."<br/>";
		if ( $this->params->get('use_module_template', 1) == 0) {

		$pf =0;
		$format = $this->params->get('module_format', "%t %c %s %r %f %m");
		// $format = str_replace('"', '\"', $format);
		// echo "DEBUG1: ".htmlspecialchars($format)."<br/>"; 
		
		$out = str_replace(array("%t","%r","%s","%f","%m","%c"), array($mod_title_out,$rows_out,$scroll_start,$scroll_finish,$mod_automore_out,$mod_cat_out), $format);
		
		/* for ( $i=0; $i < strlen( $format); $i += 1 ) {
				if ( $format[$i] == "%" ) {
				   $pf = 1;
				} else {
				   if ( $pf==1 ) {
					  $pf = 0;
					  switch ( $format[$i] ) {
					  case "t":
						 $out .= $mod_title_out;
						 break;
					  case "r":
						 $out .= $rows_out;
						 break;
					  case "s":
						 $out .= $scroll_start;
						 break;
					  case "f":
						 $out .= $scroll_finish;
						 break;
					  case "m":
						 $out .= $mod_automore_out;
						 break;
					  case "%":
						 echo "%";
						 break;
					  default:
					  } // switch
				   } else {
					  $out .= $format[$i];
				   } // if ( pf
				} // if ( $format[i] == "%" )
				// echo $out;
			 } // for  */
			 // echo "DEBUG2: ".htmlspecialchars($out)."<br/>"; 
			 //$out = str_replace('"', '\"', $out);
			 //echo "DEBUG2: ".htmlspecialchars($out)."<br/>"; 
			// 
		} else {
			// echo "DEBUG: ".htmlspecialchars($this->params->get('module_template'))."<br/>"; 
			eval("\$out = ".str_replace('"', '"', $this->params->get('module_template')).";");
	   //eval("\$str = \"$str\";");
		}

	}
	
	// echo "DEBUG2".print_r($out)."<br/>";
	
	// echo $out ? "\n<!-- BEGIN '".$this->version."' -->\n".$out."\n<!-- END '".$this->version."' -->\n" : $out;
	echo "<!-- BEGIN '".$this->version."' -->".$out."<!-- END '".$this->version."' -->\n";
	

} // dn_main

}


?>