-- Friend Requests I: Overall Acceptance Rate

select (
           IS_NULL(ROUND((select count(distinct sender_id, send_to_id) from friend_request)
                             / (select count(distinct requester_id, accepter_id) from request_accepted), 2), 0)
           ) as accept_rate;