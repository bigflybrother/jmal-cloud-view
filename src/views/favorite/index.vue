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
        order: "descending",
      },
      queryCondition: {
        isFavorite: true,
      },
      singleMenus: [
        { iconClass: "menu-download", label: "下载", operation: "download" },
      ],
      singleMenusEdit: [
        { iconClass: "menu-download", label: "下载", operation: "download" },
      ],
      multipleMenus: [
        { iconClass: "menu-download", label: "下载", operation: "download" },
      ],
      multipleRightMenus: [
        { iconClass: "menu-download", label: "下载", operation: "download" },
      ],
    };
  },
};
</script>

<style lang="scss" scoped></style>
