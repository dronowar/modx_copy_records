INSERT IGNORE INTO `new_ocrink`.`modx_site_content` 
(`type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`, `alias_visible`)
SELECT `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `class_key`, `context_key`, `content_type`, `uri`, `uri_override`, `hide_children_in_tree`, `show_in_tree`, `properties`, `alias_visible` 
FROM `ocrink`.`modx_site_content` WHERE `createdon` > 1586768400 ORDER BY `createdon`  DESC

INSERT IGNORE INTO `ocrink`.`modx_site_tmplvar_contentvalues_new` (contentid, `value`, tmplvarid)
SELECT `new_ocrink`.`modx_site_content`.`id`, `value`, tmplvarid
FROM `ocrink`.`modx_site_tmplvar_contentvalues`
LEFT JOIN `ocrink`.`modx_site_content` ON `ocrink`.`modx_site_tmplvar_contentvalues`.`contentid` = `ocrink`.`modx_site_content`.`id`
LEFT JOIN `new_ocrink`.`modx_site_content` ON `new_ocrink`.`modx_site_content`.`alias` = `ocrink`.`modx_site_content`.`alias`
WHERE `ocrink`.`modx_site_content`.`id` IN (
  SELECT `ocrink`.`modx_site_content`.`id` 
  FROM `ocrink`.`modx_site_content` WHERE `createdon` > 1586768400 ORDER BY `createdon`  DESC
)
