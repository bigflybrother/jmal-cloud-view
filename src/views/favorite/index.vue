<template>
  <div>
    <show-file
      :isCollectView="true"
      :defaultGrid="false"
      :sortable="sortable"
      :orderCustom="true"
      :defaultSort="sortable"
      :queryCondition="queryCondition"
      :singleMenus="singleMenus"
      :singleMenusEdit="singleMenusEdit"
      :multipleMenus="multipleMenus"
      :multipleRightMenus="multipleRightMenus"
    >
    </show-file>
  </div>
</template>

<script>
import ShowFile from "@/components/ShowFile/ShowFile";

export default {
  components: { ShowFile },
  data() {
    return {
      sortable: {
        prop: "updateDate",
        order: "descending"
      },
      queryCondition: {
        isFavorite: true
      },
      singleMenus: [
        { iconClass: "menu-open", label: "打开", operation: "open" },
        { iconClass: "menu-download", label: "下载", operation: "download" }
        // { iconClass: 'menu-favorite-hover', label: '取消收藏', operation: 'unFavorite' }
      ],
      singleMenusEdit: [
        { iconClass: "menu-open", label: "打开", operation: "open" },
        { iconClass: "menu-download", label: "下载", operation: "download" }
        // { iconClass: 'menu-favorite-hover', label: '取消收藏', operation: 'unFavorite' }
      ],
      multipleMenus: [
        { iconClass: "menu-download", label: "下载", operation: "download" },
        {
          iconClass: "menu-favorite-hover",
          label: "取消收藏",
          operation: "unFavorite"
        }
      ],
      multipleRightMenus: [
        { iconClass: "menu-download", label: "下载", operation: "download" },
        {
          iconClass: "menu-favorite-hover",
          label: "取消收藏",
          operation: "unFavorite"
        }
      ]
    };
  }
};
</script>

<style lang="scss" scoped></style>
