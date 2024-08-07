/* 현재 발송 중인 이벤트의 위치를 확인 */
SELECT * FROM querypie_log.l_log_scan_cursor;

/* SIEM 전송 대상 이벤트를 수집하고 이를 테이블에 저장 */
SELECT * FROM querypie_log.l_syslog_legacy_siem_events;

/* 테이블에 저장된 이벤트를 스캔하여 SIEM 서버로 전송 */
/* 발송 실패할 경우 1차적으로 재전송을 시도하고, 이 재전송에서도 실패할 경우 해당 이벤트는 별도의 테이블에 저장 */
SELECT * FROM querypie_log.l_siem_send_fail_logs;
SELECT * FROM querypie_log.l_siem_send_fail_logs_bak;
---

/* SYSLOG LEGACY

*/

/* 현재 발송 중인 이벤트의 cursor(=seq), log_id 를 조회 */
SELECT c.`cursor`, e.`log_id` FROM querypie_log.l_log_scan_cursor c JOIN querypie_log.l_syslog_legacy_siem_events e ON c.`cursor` = e.`seq`;
/* 1차 재전송에 실패한 이벤트들의 cursor(=seq), log_id 를 조회 */
SELECT * FROM querypie_log.l_syslog_legacy_siem_events WHERE log_id IN (SELECT log_id FROM querypie_log.l_siem_send_fail_logs) ORDER BY seq DESC;
/* 현재 수집된 최신 이벤트의 seq 조회 */
SELECT max(seq) FROM querypie_log.l_syslog_legacy_siem_events;

SELECT 1;
SELECT 2;
SELECT 3;/* 현재 발송 중인 이벤트의 위치를 확인 */
SELECT * FROM querypie_log.l_log_scan_cursor;

/* SIEM 전송 대상 이벤트를 수집하고 이를 테이블에 저장 */
SELECT * FROM querypie_log.l_syslog_legacy_siem_events;

/* 테이블에 저장된 이벤트를 스캔하여 SIEM 서버로 전송 */
/* 발송 실패할 경우 1차적으로 재전송을 시도하고, 이 재전송에서도 실패할 경우 해당 이벤트는 별도의 테이블에 저장 */
SELECT * FROM querypie_log.l_siem_send_fail_logs;
SELECT * FROM querypie_log.l_siem_send_fail_logs_bak;
---

/* SYSLOG LEGACY

*/

/* 현재 발송 중인 이벤트의 cursor(=seq), log_id 를 조회 */
SELECT c.`cursor`, e.`log_id` FROM querypie_log.l_log_scan_cursor c JOIN querypie_log.l_syslog_legacy_siem_events e ON c.`cursor` = e.`seq`;
/* 1차 재전송에 실패한 이벤트들의 cursor(=seq), log_id 를 조회 */
SELECT * FROM querypie_log.l_syslog_legacy_siem_events WHERE log_id IN (SELECT log_id FROM querypie_log.l_siem_send_fail_logs) ORDER BY seq DESC;
/* 현재 수집된 최신 이벤트의 seq 조회 */
SELECT max(seq) FROM querypie_log.l_syslog_legacy_siem_events;

SELECT 1;
SELECT 2;
SELECT 3;
