Feature: 簡易 Todo Web App
  As a 個人使用者
  I want to 管理我的待辦事項
  So that 我可以追蹤需要完成的任務

  Background:
    Given 我打開 Todo 應用程式

  Scenario: 新增待辦事項
    When 我在輸入框輸入 "買牛奶"
    And 我按下 Enter 鍵
    Then 我應該在列表中看到 "買牛奶"
    And 輸入框應該被清空

  Scenario: 新增待辦事項 - 使用按鈕
    When 我在輸入框輸入 "完成報告"
    And 我點擊新增按鈕
    Then 我應該在列表中看到 "完成報告"
    And 輸入框應該被清空

  Scenario: 禁止新增空白待辦事項
    When 我不輸入任何內容
    And 我按下 Enter 鍵
    Then 列表中不應該新增任何項目
    And 輸入框保持空白

  Scenario: 標記待辦事項為完成
    Given 列表中有一個待辦事項 "學習 React"
    When 我點擊該項目的勾選框
    Then 該項目應該顯示為已完成狀態
    And 該項目應該有刪除線樣式

  Scenario: 取消標記已完成的待辦事項
    Given 列表中有一個已完成的待辦事項 "練習 TypeScript"
    When 我點擊該項目的勾選框
    Then 該項目應該顯示為未完成狀態
    And 該項目不應該有刪除線樣式

  Scenario: 刪除待辦事項
    Given 列表中有一個待辦事項 "整理房間"
    When 我點擊該項目的刪除按鈕
    Then 該項目應該從列表中移除
    And 列表中不應該再看到 "整理房間"

  Scenario: 資料持久化 - 重新載入頁面
    Given 列表中有以下待辦事項:
      | 項目        | 狀態   |
      | 寫程式      | 未完成 |
      | 運動        | 完成   |
      | 閱讀        | 未完成 |
    When 我重新載入頁面
    Then 我應該看到相同的待辦事項列表
    And 每個項目的完成狀態應該保持不變

  Scenario: 多個待辦事項操作
    When 我新增待辦事項 "任務一"
    And 我新增待辦事項 "任務二"
    And 我新增待辦事項 "任務三"
    And 我標記 "任務二" 為完成
    And 我刪除 "任務一"
    Then 列表中應該只有 "任務二" 和 "任務三"
    And "任務二" 應該顯示為已完成狀態
    And "任務三" 應該顯示為未完成狀態