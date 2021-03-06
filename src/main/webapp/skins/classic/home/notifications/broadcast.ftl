<#include "macro-notifications.ftl">
<@notifications "broadcast">
<#if broadcastNotifications?size != 0>
<ul class="notification">
    <#list broadcastNotifications as notification>
    <li class="fn-flex<#if notification.hasRead> read</#if>">
        <#if "someone" != notification.authorName>
        <a target="_blank" rel="nofollow" href="${servePath}/member/${notification.authorName}"></#if>
            <div class="avatar" title="${notification.authorName}"
                 style="background-image:url('${notification.thumbnailURL}-64.jpg?${notification.thumbnailUpdateTime?c}')"></div>
        <#if "someone" != notification.authorName></a></#if>
        <div class="fn-flex-1 has-view">
            <h2>
                <#if notification.articleType == 1>
                <span class="icon-locked" title="${discussionLabel}"></span>
                <#elseif notification.articleType == 2>
                <span class="icon-feed" title="${cityBroadcastLabel}"></span>
                </#if>
                <a rel="bookmark" href="${notification.url}"> ${notification.articleTitle}</a>
            </h2>
            <div class="ft-gray">
                <#list notification.articleTags?split(",") as articleTag>
                <a class="tag" rel="tag" href="${servePath}/tag/${articleTag?url('UTF-8')}">
                    ${articleTag}</a>
                </#list> &nbsp;
                <span class="icon-date"></span>
                ${notification.createTime?string('yyyy-MM-dd HH:mm')}
            </div> 
        </div>
        <#if notification.articleCommentCount != 0>
        <div class="cmts" title="${cmtLabel}">
            <a class="count ft-gray" href="${notification.url}">${notification.articleCommentCount}</a>
        </div>
        </#if>
    </li>
    </#list>
</ul>
<#else>
<div class="responsive-show fn-hr5"></div>
${noMessageLabel}
</#if>

<@pagination url="/notifications/broadcast"/>
</@notifications>