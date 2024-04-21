
if :P10042_USER_NAME = :APP_USER and
    apex_acl.is_role_removed_from_user (
        p_application_id => :APP_ID,
        p_user_name      => :APP_USER,
        p_role_static_id => 'ADMINISTRATOR',
        p_role_ids       => apex_string.split_numbers(
                                p_str => case when :REQUEST = 'DELETE' then
                                             null
                                         else
                                             :P10042_ROLE_IDS
                                         end,
                                p_sep => ':') ) then
    return false;
else
    return true;
end if;