export default defineEventHandler(async (event) => {
    return await $fetch(useRuntimeConfig().public.API_BASE_URL + '/api/potensi-desa/slug/' + getRouterParam(event, 'id'))
})