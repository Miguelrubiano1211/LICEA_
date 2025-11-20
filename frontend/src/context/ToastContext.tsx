import React, { createContext, useContext, useState, useCallback } from 'react';

export type ToastType = 'success' | 'error' | 'info' | 'warning';

export interface ToastOptions {
  type: ToastType;
  title: string;
  message?: string;
  duration?: number;
}

interface Toast extends ToastOptions {
  id: number;
}

interface ToastContextValue {
  showToast: (options: ToastOptions) => void;
}

const ToastContext = createContext<ToastContextValue | undefined>(undefined);

export const ToastProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [toasts, setToasts] = useState<Toast[]>([]);

  const removeToast = useCallback((id: number) => {
    setToasts((prev) => prev.filter((toast) => toast.id !== id));
  }, []);

  const showToast = useCallback(({ type, title, message, duration = 4000 }: ToastOptions) => {
    const id = Date.now() + Math.random();
    setToasts((prev) => [...prev, { id, type, title, message, duration }]);

    // Auto-remove after duration
    setTimeout(() => removeToast(id), duration);
  }, [removeToast]);

  const getToastStyles = (type: ToastType) => {
    switch (type) {
      case 'success':
        return 'border-green-400 bg-green-50';
      case 'error':
        return 'border-red-400 bg-red-50';
      case 'warning':
        return 'border-yellow-400 bg-yellow-50';
      case 'info':
      default:
        return 'border-blue-400 bg-blue-50';
    }
  };

  const getToastIcon = (type: ToastType) => {
    switch (type) {
      case 'success':
        return '✅';
      case 'error':
        return '⚠️';
      case 'warning':
        return '⚠️';
      case 'info':
      default:
        return 'ℹ️';
    }
  };

  return (
    <ToastContext.Provider value={{ showToast }}>
      {children}
      <div className="fixed top-4 right-4 z-[9999] space-y-3">
        {toasts.map((toast) => (
          <div
            key={toast.id}
            className={`max-w-sm w-full rounded-lg shadow-lg border px-4 py-3 flex items-start space-x-3 ${getToastStyles(
              toast.type
            )}`}
          >
            <div className="text-xl">
              {getToastIcon(toast.type)}
            </div>
            <div className="flex-1">
              <p className="font-semibold text-gray-900">{toast.title}</p>
              {toast.message && (
                <p className="text-sm text-gray-700 mt-1">{toast.message}</p>
              )}
            </div>
            <button
              onClick={() => removeToast(toast.id)}
              className="text-gray-400 hover:text-gray-600 ml-2"
            >
              ✕
            </button>
          </div>
        ))}
      </div>
    </ToastContext.Provider>
  );
};

export const useToast = (): ToastContextValue => {
  const context = useContext(ToastContext);
  if (!context) {
    throw new Error('useToast must be used within a ToastProvider');
  }
  return context;
};
