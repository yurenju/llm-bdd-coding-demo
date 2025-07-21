# 實作計畫 - 簡易 Todo Web App

## 概述
本文件詳細說明簡易 Todo Web App 的實作計畫，包含任務分解、技術細節和檔案結構規劃。

## 高層級任務清單

### 1. 初始化 Vite + React + TypeScript 專案並設定基本架構
**優先級**：高
**預估時間**：15 分鐘
**相關檔案**：
- 新建：`package.json`, `tsconfig.json`, `vite.config.ts`
- 新建：`index.html`, `src/main.tsx`
**技術細節**：
- 在臨時目錄創建專案：
  ```bash
  cd /tmp
  npm create vite@latest todo-app -- --template react-ts
  cd todo-app
  npm install
  ```
- 將專案檔案移動到目標目錄：
  ```bash
  # 將所有檔案（包含隱藏檔）複製到專案根目錄
  cp -r /tmp/todo-app/* /tmp/todo-app/.[^.]* [專案根目錄]/
  ```
- 清理臨時目錄：
  ```bash
  rm -rf /tmp/todo-app
  ```

### 2. 建立 Todo 資料模型和 TypeScript 介面定義
**優先級**：高  
**預估時間**：10 分鐘
**相關檔案**：
- 新建：`src/types/Todo.ts`
**技術細節**：
```typescript
interface Todo {
  id: string;
  text: string;
  completed: boolean;
  createdAt: number;
}
```

### 3. 實作 TodoInput 輸入組件（包含新增功能）
**優先級**：高
**預估時間**：30 分鐘
**相關檔案**：
- 新建：`src/components/TodoInput.tsx`
- 新建：`src/components/TodoInput.module.css` (可選)
**功能需求**：
- 輸入框和新增按鈕
- Enter 鍵監聽
- 空白輸入驗證
- 清空輸入框邏輯

### 4. 實作 TodoItem 組件（顯示、完成狀態切換、刪除功能）
**優先級**：高
**預估時間**：30 分鐘
**相關檔案**：
- 新建：`src/components/TodoItem.tsx`
- 新建：`src/components/TodoItem.module.css` (可選)
**功能需求**：
- 顯示待辦事項文字
- 勾選框切換完成狀態
- 刪除按鈕
- 完成狀態的視覺呈現（刪除線）

### 5. 實作 TodoList 組件和整體列表管理
**優先級**：中
**預估時間**：20 分鐘
**相關檔案**：
- 新建：`src/components/TodoList.tsx`
- 新建：`src/components/TodoList.module.css` (可選)
**功能需求**：
- 渲染待辦事項列表
- 傳遞狀態更新回調函數

### 6. 實作 localStorage 資料持久化機制
**優先級**：高
**預估時間**：25 分鐘
**相關檔案**：
- 新建：`src/hooks/useLocalStorage.ts` (可選)
- 修改：`src/App.tsx`
**技術細節**：
- 在 App 組件中使用 useEffect 讀取 localStorage
- 每次狀態變更時更新 localStorage
- 使用 JSON.stringify/parse 處理資料

### 7. 套用極簡風格的 CSS 樣式設計
**優先級**：中
**預估時間**：30 分鐘
**相關檔案**：
- 修改：`src/App.css`
- 新建/修改：各組件的 CSS 檔案
**設計原則**：
- 中性色調（黑、白、灰）
- 系統預設字體
- 適當留白和間距
- 簡潔的互動回饋

### 8. 執行驗收測試確認所有功能正常運作
**優先級**：高
**預估時間**：20 分鐘
**相關檔案**：
- 參考：`acceptance.feature`
**測試重點**：
- 手動測試所有 Gherkin 場景
- 確認 localStorage 持久化
- 驗證使用者互動流程

## 檔案結構規劃

```
project-root/
├── index.html
├── package.json
├── tsconfig.json
├── vite.config.ts
├── src/
│   ├── main.tsx
│   ├── App.tsx
│   ├── App.css
│   ├── types/
│   │   └── Todo.ts
│   ├── components/
│   │   ├── TodoInput.tsx
│   │   ├── TodoInput.module.css
│   │   ├── TodoList.tsx
│   │   ├── TodoList.module.css
│   │   ├── TodoItem.tsx
│   │   └── TodoItem.module.css
│   └── hooks/
│       └── useLocalStorage.ts (可選)
```

## 實作順序建議

1. **階段一：專案初始化**
   - 建立專案結構
   - 定義資料模型

2. **階段二：核心組件開發**
   - TodoInput 組件
   - TodoItem 組件
   - TodoList 組件

3. **階段三：狀態管理與持久化**
   - App 組件整合
   - localStorage 實作

4. **階段四：美化與測試**
   - CSS 樣式套用
   - 驗收測試執行

## 技術注意事項

1. **狀態管理**：
   - 所有狀態集中在 App 組件
   - 透過 props 傳遞資料和回調函數

2. **TypeScript 使用**：
   - 為所有 props 定義介面
   - 使用嚴格模式確保類型安全

3. **效能考量**：
   - 使用 React.memo 優化重複渲染（如需要）
   - 使用 key 屬性正確處理列表渲染

4. **錯誤處理**：
   - localStorage 讀寫異常處理
   - 輸入驗證

## 預估總時間
約 3-4 小時完成所有實作和測試