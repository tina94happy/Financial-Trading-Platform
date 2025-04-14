<template>
    <div class="v-admin-sy">
        {{setting.title}} Backstage System Management
    </div>
</template>
<style type="text/scss" lang="scss">

</style>
<script>
    const setting = require('@/setting')
    export default {
        name: "v-admin-sy",
        data() {
            return {
                setting
            }
        },
        watch: {},
        computed: {},
        methods: {},
        created() {

        },
        mounted() {
        },
        destroyed() {
        }
    }
</script>
